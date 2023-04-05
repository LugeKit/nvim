Window = {}
local util = require("k1.util")
local window_resize_mode_enabled = false
local arrow_mappings = {}

local function reset_keys()
	util.restore_mappings("n", arrow_mappings)
	arrow_mappings = {}
end

local function resize_with_arrow()
	arrow_mappings = util.save_mappings("n", { "<Up>", "<Down>", "<Left>", "<Right>" }, true)
	util.map("n", "<Up>", "<C-w>+", {})
	util.map("n", "<Down>", "<C-w>-", {})
	util.map("n", "<Left>", "<C-w><", {})
	util.map("n", "<Right>", "<C-w>>", {})
end

function Window.toggle_window_resize_mode()
	if not window_resize_mode_enabled then
		window_resize_mode_enabled = true
		resize_with_arrow()
	else
		window_resize_mode_enabled = false
		reset_keys()
	end
end

return Window
