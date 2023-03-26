-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<F2>', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
-- vim.keymap.set('n', '<leader><F2>', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<F2>', vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		-- vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
		-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		-- vim.keymap.set('n', '<C-[>', ':lua require(\'telescope.builtin\').lsp_references { show_line = false }<CR>', opts)
		-- vim.keymap.set('n', '<C-\\>', ':Telescope lsp_type_definitions<CR>', opts)
		-- vim.keymap.set('n', '<C-i>', ':Telescope lsp_implementations<CR>', opts)
		-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		-- vim.keymap.set('n', '<S-k>', vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		-- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
		-- vim.keymap.set('n', '<space>f', function()
		--	vim.lsp.buf.format { async = true }
		-- end, opts)
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format(nil, 1000)
	end,
})

vim.diagnostic.config({ update_in_insert = true })
