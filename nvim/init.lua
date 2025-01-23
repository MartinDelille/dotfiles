require("md/core")
require("md/lazy")
require("md/themes")
local current_theme_path = vim.fn.stdpath("config") .. "/lua/current-theme.lua"
if vim.fn.filereadable(current_theme_path) == 1 then
	require("current-theme")
end
