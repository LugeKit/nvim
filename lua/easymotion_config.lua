local util = require("k1.util")

vim.g.EasyMotion_do_mapping = 0

local keymap = {
  { "n", "f",         "<Plug>(easymotion-bd-fl)", util.opts() },
  { "o", "f",         "<Plug>(easymotion-bd-fl)", util.opts() },
  { "n", "<leader>j", "<Plug>(easymotion-j)",     util.opts({ desc = "EasyMotion-j" }) },
  { "o", "<leader>j", "<Plug>(easymotion-j)",     util.opts({ desc = "EasyMotion-j" }) },
  { "n", "<leader>k", "<Plug>(easymotion-k)",     util.opts({ desc = "EasyMotion-k" }) },
  { "o", "<leader>k", "<Plug>(easymotion-k)",     util.opts({ desc = "EasyMotion-k" }) },
}

util.map_with_dicts(keymap)
