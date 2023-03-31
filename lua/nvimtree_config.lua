local function on_attach(bufnr)
	local api = require('nvim-tree.api')
	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	vim.keymap.set('n', '<CR>', api.node.open.edit, opts("Open"))
	vim.keymap.set('n', 'o', api.node.open.edit, opts("Open"))
	vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set('n', '<C-s>', api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set('n', 't', api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set('n', 'c', api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set('n', 'p', api.node.open.preview, opts('Preview'))
	vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
	vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
	vim.keymap.set('n', 'K', api.node.show_info_popup, opts('Info'))
	vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse All'))
	vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
	vim.keymap.set('n', 'Y', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  	vim.keymap.set('n', 's', api.tree.search_node, opts('Search'))
  	vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
  	vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
	vim.keymap.set('n', 'D', api.fs.remove, opts('Delete'))
	vim.keymap.set('n', 'X', api.fs.cut, opts("Cut"))
	vim.keymap.set('n', 'C', api.fs.copy.node, opts("Copy"))
	vim.keymap.set('n', 'P', api.fs.paste, opts("Paste"))
	vim.keymap.set('n', '<C-l>', api.tree.reload, opts("Refresh"))
	vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
	vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  	vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit, opts('Open'))
  	vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
end

require("nvim-tree").setup {
	on_attach = on_attach,
	view = {
		width = 50,
		number = true,
	},
}

local keymap = {
	n = { "<cmd>NvimTreeToggle<CR>", "NvimTreeToggle" },
	l = { "<cmd>NvimTreeFindFile<CR><cmd>NvimTreeFocus<CR>", "NvimTreeFocus" },
}

local wk = require("which-key")
wk.register(keymap, { prefix = "<leader>" })
