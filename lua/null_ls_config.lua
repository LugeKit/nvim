local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormat", {})

null_ls.setup {
	sources = {
		null_ls.builtins.formatting.goimports.with{
			extra_args = {"-format-only"},
		},
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr, 1000 })
				end
			})
		end
	end
}
