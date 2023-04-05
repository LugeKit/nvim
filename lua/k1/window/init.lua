local util = require("k1.util")
local mapping_helper = require("k1.mapping_helper")

local key_storage = mapping_helper.new_mappings({
  { "n", "k", "<C-w>+", util.opts({}) },
  { "n", "j", "<C-w>-", util.opts({}) },
  { "n", "h", "<C-w><", util.opts({}) },
  { "n", "l", "<C-w>>", util.opts({}) },
})

local function toggle_window_resize_mode()
  key_storage:toggle()
end

---@diagnostic disable-next-line: lowercase-global
window = {
  toggle_window_resize_mode = toggle_window_resize_mode,
}

return window
