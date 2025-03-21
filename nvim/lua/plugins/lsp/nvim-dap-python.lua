return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function(_, opts)
		require("dap-python").setup()
	end,
}
