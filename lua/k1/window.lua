require("k1.util")
M = {}
local window_resize_mode_enabled = 0

local function reset_keys()
	unmap("n", "<Up>")
	unmap("n", "<Down>")
	unmap("n", "<Left>")
	unmap("n", "<Right>")
end

local function resize_with_arrow()
	map("n", "<Up>", "<C-w>+", {})
	map("n", "<Down>", "<C-w>-", {})
	map("n", "<Left>", "<C-w><", {})
	map("n", "<Right>", "<C-w>>", {})
end

function M.toggle_window_resize_mode()
	if window_resize_mode_enabled == 1 then
		window_resize_mode_enabled = 0
		reset_keys()
	else
		window_resize_mode_enabled = 1
		resize_with_arrow()
	end
end

return M
