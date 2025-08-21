return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			sections = {
				lualine_c = {
					{
						"filename",
						path = 1,
						shorting_target = 40,
					},
				},
			},
		})
	end,
}
