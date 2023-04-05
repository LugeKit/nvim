local util = require("k1.util")
local mapping_helper = require("k1.mapping_helper")

local key_storage = mapping_helper.new_mappings({
  { "n", "<Up>",    "<C-w>+", util.opts({}) },
  { "n", "<Down>",  "<C-w>-", util.opts({}) },
  { "n", "<Left>",  "<C-w><", util.opts({}) },
  { "n", "<Right>", "<C-w>>", util.opts({}) },
  { "n", "h",       "<C-w>h", util.opts({}) },
  { "n", "l",       "<C-w>l", util.opts({}) },
  { "n", "j",       "<C-w>j", util.opts({}) },
  { "n", "k",       "<C-w>k", util.opts({}) },
})

local function toggle_window_resize_mode()
  key_storage:toggle()
end

---@diagnostic disable-next-line: lowercase-global
window = {
  toggle_window_resize_mode = toggle_window_resize_mode,
}

return window
