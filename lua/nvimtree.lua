require("utils")

map("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<leader>l", ":NvimTreeFindFile<CR>:NvimTreeFocus<CR>", { silent = true })
map("n", "<leader>c", ":NvimTreeCollapse<CR>", { silent = true })
