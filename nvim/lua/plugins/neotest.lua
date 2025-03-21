return {
	"nvim-neotest/neotest",
	keys = {
		{
			"<leader>tr",
			function()
				require("neotest").run.run()
			end,
			"Run tests",
		},
	},
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-neotest/neotest-python",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					runner = "pytest",
				}),
			},
		})
	end,
}
