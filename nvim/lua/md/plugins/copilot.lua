return {
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_filetypes = {
				["gitcommit"] = true,
			}
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "github/copilot.lua" }, -- or zbirenbaum/copilot.vim
			{ "nvim-lua/plenary.nvim" },
		},
		build = "make tiktoken",
		opts = {
			debug = true,
			mappings = {
				complete = {
					detail = "Use @<Tab> or /<Tab> for options.",
					insert = "<S-Tab>",
				},
				reset = {
					normal = "<C-r>",
					insert = "<C-r>",
				},
			},
		},
		keys = {
			{ "<leader>ccc", ":CopilotChat<CR>", desc = "Open Copilot Chat" },
			{
				"<leader>ccq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					end
				end,
				desc = "CopilotChat - Quick Chat",
			},
		},
	},
}
