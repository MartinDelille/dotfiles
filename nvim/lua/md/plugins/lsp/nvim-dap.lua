return {
	"mfussenegger/nvim-dap",
	keys = {
		{
			"<leader>db",
			"<cmd>DapToggleBreakpoint<CR>",
			mode = "n",
			desc = "Add a breakpoint at line",
		},
		{
			"<leader>dr",
			"<cmd>DapContinue<CR>",
			mode = "n",
			desc = "Start or continue the debugger",
		},
	},
	config = function()
		local dap = require("dap")
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				-- CHANGE THIS to your path!
				command = "codelldb",
				args = { "--port", "${port}" },

				-- On windows you may have to uncomment this:
				-- detached = false,
			},
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
	end,
}
