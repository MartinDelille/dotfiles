return {
	"madox2/vim-ai",
	version = false,
	keys = {
		{ ",c", "<cmd>AIChat<cr>", "AIChat" },
	},
	config = function()
		vim.g.vim_ai_chat = {
			options = {
				enable_auth = 0,
				endpoint_url = "http://localhost:8000/v1/chat/completions",
			},
		}
	end,
}
