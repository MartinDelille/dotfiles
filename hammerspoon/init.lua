local applicationChooser
local applicationChoices
local applicationTask

local function applicationName(info, path)
	return info.CFBundleDisplayName
		or info.CFBundleName
		or info.CFBundleExecutable
		or path:match("([^/]+)%.app$")
		or "Unknown application"
end

local function fuzzyScore(query, text)
	query = (query or ""):lower()
	text = text:lower()

	if query == "" then return 0 end

	local score = 0
	local queryIndex = 1
	local previousMatch = 0

	for textIndex = 1, #text do
		if text:sub(textIndex, textIndex) == query:sub(queryIndex, queryIndex) then
			local isWordBoundary = textIndex == 1 or not text:sub(textIndex - 1, textIndex - 1):match("[%w]")
			local isConsecutive = textIndex == previousMatch + 1

			score = score + 1
			if textIndex == 1 then score = score + 10 end
			if isWordBoundary then score = score + 6 end
			if isConsecutive then score = score + 4 end

			previousMatch = textIndex
			queryIndex = queryIndex + 1
			if queryIndex > #query then return score - (#text - textIndex) * 0.01 end
		end
	end

	return nil
end

local function matchingApplicationChoices(query)
	local matches = {}

	for _, choice in ipairs(applicationChoices or {}) do
		local score = fuzzyScore(query, choice.text)
		if score then table.insert(matches, { choice = choice, score = score }) end
	end

	table.sort(matches, function(left, right)
		if left.score == right.score then return left.choice.text:lower() < right.choice.text:lower() end
		return left.score > right.score
	end)

	local choices = {}
	for _, match in ipairs(matches) do
		table.insert(choices, match.choice)
	end
	return choices
end

local function refreshApplicationChoices(showChooser)
	if applicationTask then return end

	local home = os.getenv("HOME")
	local searchPaths = {
		"/Applications",
		home .. "/Applications",
		"/System/Applications",
	}
	local query = 'kMDItemContentType == "com.apple.application-bundle"'

	applicationTask = hs.task.new("/usr/bin/mdfind", function(exitCode, standardOutput)
		applicationTask = nil

		if exitCode ~= 0 then return end

		local choices = {}
		local seenBundleIDs = {}

		for path in (standardOutput or ""):gmatch("[^\r\n]+") do
			local info = hs.application.infoForBundlePath(path)
			local bundleID = info and info.CFBundleIdentifier

			if bundleID and not seenBundleIDs[bundleID] then
				seenBundleIDs[bundleID] = true
				table.insert(choices, {
					text = applicationName(info, path),
					subText = path,
					bundleID = bundleID,
				})
			end
		end

		table.sort(choices, function(left, right) return left.text:lower() < right.text:lower() end)

		applicationChoices = choices
		applicationChooser:choices(matchingApplicationChoices(applicationChooser:query()))

		if showChooser then applicationChooser:show() end
	end, { query, table.unpack(searchPaths) })
	applicationTask:start()
end

applicationChooser = hs.chooser
	.new(function(choice)
		if choice then hs.application.launchOrFocusByBundleID(choice.bundleID) end
	end)
	:placeholderText("Search applications")
	:width(600)
	:rows(10)
	:queryChangedCallback(function(query) applicationChooser:choices(matchingApplicationChoices(query)) end)

local function toggleApplicationChooser()
	if applicationChooser:isVisible() then
		applicationChooser:hide()
		return
	end

	if applicationChoices then
		applicationChooser:choices(matchingApplicationChoices(applicationChooser:query())):show()
		refreshApplicationChoices(false)
	else
		refreshApplicationChoices(true)
	end
end

hs.hotkey.bind({ "cmd", "alt" }, "space", toggleApplicationChooser)

hs.hotkey.bind(
	{},
	"F16",
	function() hs.task.new("/opt/homebrew/bin/m1ddc", nil, { "display", "1", "set", "input", "16" }):start() end
)
hs.hotkey.bind({}, "F17", function() hs.task.new("/Users/martindelille/.dotfiles/bin/swscreen", nil, {}):start() end)
hs.hotkey.bind({}, "F18", function() hs.task.new("/usr/bin/say", nil, { "baba" }):start() end)
hs.hotkey.bind({ "cmd", "shift", "alt" }, "R", function() hs.reload() end)
