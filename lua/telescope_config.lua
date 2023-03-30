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
		d = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Dynamic Symbols"},
		s = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
		a = { "<cmd>Telescope git_status<CR>", "Git Status" },
	},
}, { prefix = "<leader>" })
