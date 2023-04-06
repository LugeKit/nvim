local lspsaga = require("lspsaga")
local util = require("k1.util")

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
	},
	code_action = {
		num_shortcut = false,
	},
	symbol_in_winbar = {
		false,
	},
})

local keymap = {
  {"n", "<F2>", "<cmd>Lspsaga diagnostic_jump_next<CR>", util.opts({})},
  {"n", "K", "<cmd>Lspsaga hover_doc<CR>", util.opts({})},
  {"n", "<leader>o", "<cmd>Lspsaga outline<CR>", util.opts({})},
}
util.map_with_dicts(keymap)
