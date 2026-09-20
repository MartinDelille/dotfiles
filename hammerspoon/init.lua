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
		applicationChooser:choices(applicationChoices)

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

local function toggleApplicationChooser()
	if applicationChooser:isVisible() then
		applicationChooser:hide()
		return
	end

	if applicationChoices then
		applicationChooser:choices(applicationChoices):show()
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
hs.hotkey.bind({ "cmd", "shift", "alt" }, "R", function() hs.reload() end)
