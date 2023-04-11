local util = require("k1.util")
local window = require("k1.window")
local map = util.map
local opts = util.opts

-- tabs
map("n", "<leader>1", "1gt", opts())
map("n", "<leader>2", "2gt", opts())
map("n", "<leader>3", "3gt", opts())
map("n", "<leader>4", "4gt", opts())
map("n", "<leader>5", "5gt", opts())
map("n", "<leader>6", "6gt", opts())
map("n", "<leader>7", "7gt", opts())
map("n", "<leader><TAB>", "gt", opts({ desc = "Next Tab" }))
map("n", "<leader><S-TAB>", "gT", opts({ desc = "Previous Tab" }))
map("n", "<leader>t", "<cmd>tabnew<CR>", opts({ desc = "New Tab" }))

-- disable highlight with <ESC>, this is probably the best way
map("", "<ESC>", "<ESC><cmd>silent noh<CR>", opts())

-- movements
map("n", "<C-j>", "10<down>", opts())
map("v", "<C-j>", "10<down>", opts())
map("n", "<C-k>", "10<up>", opts())
map("v", "<C-k>", "10<up>", opts())
map("n", "<C-h>", "^", opts())
map("v", "<C-h>", "^", opts())
map("o", "<C-h>", "^", opts())
map("n", "<C-l>", "$", opts())
map("v", "<C-l>", "$", opts())
map("o", "<C-l>", "$", opts())

-- paste
map("c", "<C-v>", "<C-r>+", opts())
map("i", "<C-v>", "<C-r>+", opts())
map("i", "<C-z>", "<Esc>zzgi", opts())

-- surroud visual selected
map("x", '"', '<ESC>`<v`><ESC>a"<ESC>`<i"<ESC>`>2l', opts())
map("x", "'", "<ESC>`<v`><ESC>a'<ESC>`<i'<ESC>`>2l", opts())
map("x", "(", "<ESC>`<v`><ESC>a)<ESC>`<i(<ESC>`>2l", opts())
map("x", "[", "<ESC>`<v`><ESC>a]<ESC>`<i[<ESC>`>2l", opts())

map("v", "y", "y`>0", opts({ desc = "Jump To End After Yank" }))
-- <ESC> in tmode to nmode
map("t", "<ESC>", "<C-\\><C-n>", opts())

-- special
map("n", "<leader>w", window.toggle_window_resize_mode, opts({ desc = "Toggle Window Mode" }))

-- better navigate
map("n", "<C-o>", "<C-o>zz", opts())
map("n", "<C-i>", "<C-i>zz", opts())

-- better search
map("n", "/", "/\\v", opts({ silent = false }))
map("n", "?", "?\\v", opts({ silent = false }))
map("n", "<C-s>", ":%s/\\v", opts({ silent = false }))

-- use ; to enter command line
map("n", ";", ":", opts({ silent = false }))
map("n", ":", ";", opts())

-- in V mode, indent multiple times
map("v", "<", "<gv", opts())
map("v", ">", ">gv", opts())

local function test()
  vim.ui.input({
    prompt = "test",
    completion = "command",
  }, function(input)
    print(input)
  end)
end
map("n", "<leader>k", test, opts())
