local lspsaga = require("lspsaga")

lspsaga.setup {
	scroll_preview = {
		scroll_down = '<C-j>',
		scroll_up = '<C-k>',
	},
	finder = {
		keys = {
			vsplit = 'v',
			split = 's',
			tabnew = 't',
			tabe = 'r',
		},
	},
}

vim.keymap.set('n', '<C-]>', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>')
vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename ++project<CR>')
vim.keymap.set('n', '<F2>', '<cmd>Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', '<leader><F2>', '<cmd>Lspsaga show_buf_diagnostics<CR>')
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
