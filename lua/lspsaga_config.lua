local lspsaga = require("lspsaga")

lspsaga.setup({
	scroll_preview = {
		scroll_down = "<C-j>",
		scroll_up = "<C-k>",
	},
	finder = {
		max_height = 0.8,
		force_max_height = true,
		keys = {
			vsplit = "<C-v>",
			split = "<C-s>",
			edit = "<CR>",
			quit = { "q", "<C-c>", "<ESC>" },
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
	symbol_in_winbar = {
		false,
	},
})

vim.keymap.set("n", "<C-]>", "<cmd>Lspsaga lsp_finder<CR>")
vim.keymap.set("n", "<F2>", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "<leader><F2>", "<cmd>Lspsaga show_buf_diagnostics<CR>")
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

local wk = require("which-key")
wk.register({
	y = { "<cmd>Lspsaga goto_type_definition<CR>", "Go To Type Definition" },
	d = { "<cmd>Lspsaga goto_definition<CR>", "Go To Definition" },
}, { prefix = "g" })
