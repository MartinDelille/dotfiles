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
		require("cmake-tools").setup({
			cmake_runner = {
				default_opts = {
					terminal = {
						split_direction = "horizontal",
						split_size = 31,
					},
				},
			},
		})
	end,
}
