local function on_attach(bufnr)
	local api = require('nvim-tree.api')
	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.set('n', 'c', api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set('n', 'C', api.fs.copy.node, opts("Copy"))
	vim.keymap.set('n', 'p', api.node.open.preview, opts("Open Preview"))
	vim.keymap.set('n', 'P', api.fs.paste, opts("Paste"))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
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
