local util = require("k1.util")

local keymap = {
  { "n", "<F1>", "<cmd>FloatermToggle<CR>", {} },
  { "t", "<F1>", "<cmd>FloatermToggle<CR>", {} },
  { "i", "<F1>", "<cmd>FloatermToggle<CR>", {} },
}

util.map_with_dicts(keymap)

vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
