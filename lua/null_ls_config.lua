local null_ls = require("null-ls")

null_ls.setup({
	log_level = "trace",
	sources = {
		null_ls.builtins.formatting.goimports.with({
			extra_args = { "-local", vim.trim(vim.fn.system({ "go", "list", "-m" })) },
		}),
		null_ls.builtins.diagnostics.tidy,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua.with({}),
		null_ls.builtins.formatting.gofumpt.with({}),
	},
	on_attach = function(c, bufnr)
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		if c.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
