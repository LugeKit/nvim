local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("NullLSFormat", { clear = true })

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.goimports.with({
			extra_args = { "-local", vim.trim(vim.fn.system({ "go", "list", "-m" })) },
		}),
		null_ls.builtins.formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr, 1000 })
				end,
			})
		end
	end,
})
