require("utils")

map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fd', ':Telescope tags<CR>')
map('n', '<leader>fs', ':Telescope live_grep<CR>')

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
