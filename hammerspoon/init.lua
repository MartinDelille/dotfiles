hs.hotkey.bind(
	{},
	"F16",
	function() hs.task.new("/opt/homebrew/bin/m1ddc", nil, { "display", "1", "set", "input", "16" }):start() end
)
hs.hotkey.bind({ "cmd", "shift", "alt" }, "R", function() hs.reload() end)
