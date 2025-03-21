require("core/options")
require("core/keymaps")

---@param fallback? string
---@return string|nil
_G.get_colorscheme = function(fallback)
	if not vim.g.COLORS_NAME then vim.cmd.rshada() end
	return vim.g.COLORS_NAME or fallback
end

---@param colorscheme? string
_G.save_colorscheme = function(colorscheme)
	colorscheme = colorscheme or vim.g.colors_name
	if get_colorscheme() == colorscheme then return end
	vim.g.COLORS_NAME = colorscheme
	vim.cmd.wshada()
end
