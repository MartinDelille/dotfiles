return {
	{ "catppuccin/vim" },
	{ "folke/tokyonight.nvim" },
	{
		"sonph/onehalf",
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/vim")
		end,
	},
}
