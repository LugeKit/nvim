local M = {}

function M.setup()
	require("k1.keymap")
	require("k1.command")
	require("k1.function").setup()
end

return M
