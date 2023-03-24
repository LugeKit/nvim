local function on_attach(bufnr)
	local api = require('nvim-tree.api')
	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set('n', 'P', api.node.open.preview, opts("Open Preview"))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

require("nvim-tree").setup {
	on_attach = on_attach,
}

require("utils")
map("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<leader>l", ":NvimTreeFindFile<CR>:NvimTreeFocus<CR>", { silent = true })
map("n", "<leader>c", ":NvimTreeCollapse<CR>", { silent = true })
