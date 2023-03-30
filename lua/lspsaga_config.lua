local lspsaga = require("lspsaga")

lspsaga.setup {
	scroll_preview = {
		scroll_down = '<C-j>',
		scroll_up = '<C-k>',
	},
	finder = {
		max_height = 1.0,
		keys = {
			vsplit = 'v',
			split = 's',
			expand_or_jump = '<CR>',
			quit = { 'q', '<C-c>', '<ESC>' },
		},
	},
	diagnostic = {
		on_insert = false,
		on_insert_follow = false,
	},
	lightbulb = {
		enable = false,
		enable_in_insert = false,
	},
	code_action = {
		num_shortcut = false,
	},
}

vim.keymap.set('n', '<C-]>', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>')
vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename ++project<CR>')
vim.keymap.set('n', '<F2>', '<cmd>Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', '<leader><F2>', '<cmd>Lspsaga show_buf_diagnostics<CR>')
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
