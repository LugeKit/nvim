local wk = require("which-key")
wk.register({
	["1"] = { "1gt", "Tab 1" },
	["2"] = { "2gt", "Tab 2" },
	["3"] = { "3gt", "Tab 3" },
	["4"] = { "4gt", "Tab 4" },
	["5"] = { "5gt", "Tab 5" },
	["6"] = { "6gt", "Tab 6" },
	["7"] = { "7gt", "Tab 7" },
	["<TAB>"] = { "gt", "Next Tab" },
	["<S-TAB>"] = { "gT", "Previous Tab" },
	t = { "<cmd>tabnew<CR>", "New Tab" },
	["<BS>"] = { "<cmd>bd<CR>", "Delete Current Buffer" },
}, {
	prefix = "<leader>",
})

local utils = require("k1.utils")
local map = utils.map
local opts = utils.opts

-- disable highlight with <ESC>, this is probably the best way
map("", "<ESC>", "<ESC><cmd>silent noh<CR>", opts({}))

-- movements
map("n", "<C-j>", "10<down>", opts({}))
map("v", "<C-j>", "10<down>", opts({}))
map("n", "<C-k>", "10<up>", opts({}))
map("v", "<C-k>", "10<up>", opts({}))
map("n", "<C-h>", "^", opts({}))
map("v", "<C-h>", "^", opts({}))
map("n", "<C-l>", "$", opts({}))
map("v", "<C-l>", "$", opts({}))
map("c", "<C-h>", "<C-left>", opts({}))
map("c", "<C-l>", "<C-right>", opts({}))

-- paste
map("c", "<C-v>", '<C-r>"', opts({}))
map("i", "<C-v>", '<C-r>"', opts({}))

-- surroud visual selected
map("v", '"', '<ESC>`<v`><ESC>a"<ESC>`<i"<ESC>`>2l', opts({}))
map("v", "'", "<ESC>`<v`><ESC>a'<ESC>`<i'<ESC>`>2l", opts({}))
map("v", "(", "<ESC>`<v`><ESC>a)<ESC>`<i(<ESC>`>2l", opts({}))
map("v", "[", "<ESC>`<v`><ESC>a]<ESC>`<i[<ESC>`>2l", opts({}))

map("v", "y", "y`>0", opts({ desc = "Jump To End After Yank" }))

map("n", "<F1>", "<cmd>tabnew<CR><cmd>terminal<CR>a", opts({ desc = "Open Terminal In New Tab" }))
map("t", "<ESC>", "<C-\\><C-n>", opts({}))
