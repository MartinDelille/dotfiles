return {
	"Civitasv/cmake-tools.nvim",
	keys = {
		{
			"<leader>cb",
			"<cmd>CMakeBuild<CR>",
			desc = "CMake build",
		},
		{
			"<leader>cr",
			"<cmd>CMakeRun<CR>",
			desc = "CMake run",
		},
	},
	config = function()
		require("cmake-tools").setup({})
	end,
}
