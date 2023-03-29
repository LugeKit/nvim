local lsp_signature = require("lsp_signature")
lsp_signature.setup {
	bind = true,
	handler_opts = {
		border = "single",
	},
	hint_enable = false,
	toggle_key = "<C-k>",
}

