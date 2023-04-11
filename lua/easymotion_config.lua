local util = require("k1.util")

vim.g.EasyMotion_do_mapping = 0

local keymap = {
  { "n", "f", "<Plug>(easymotion-bd-f)", util.opts() },
  { "o", "f", "<Plug>(easymotion-bd-f)", util.opts() },
}

util.map_with_dicts(keymap)
