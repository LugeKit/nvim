local M = {}

M.map = vim.api.nvim_set_keymap

--- @param opt? table<string, any>
function M.opts(opt)
	local _opt = { noremap = true }
	return vim.tbl_extend("keep", opt, _opt)
end

return M
