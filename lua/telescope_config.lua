require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<C-j>'] = require('telescope.actions').move_selection_next,
				['<C-k>'] = require('telescope.actions').move_selection_previous,
			},
		},
	},
}

local wk = require("which-key")
wk.register({
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<CR>", "Find File" },
		s = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
	},
}, { prefix = "<leader>" })
