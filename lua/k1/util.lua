map = vim.api.nvim_set_keymap
unmap = vim.api.nvim_del_keymap

--- @param opt? table<string, any>
function opts(opt)
	local _opt = { noremap = true }
	return vim.tbl_extend("keep", opt, _opt)
end
