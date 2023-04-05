---@diagnostic disable: param-type-mismatch, undefined-field
Util = {}
Util.map = vim.api.nvim_set_keymap
Util.unmap = vim.api.nvim_del_keymap
Util.unmap_buffer = vim.api.nvim_buf_del_keymap

--- @param opt? table<string, any>
function Util.opts(opt)
	local _opt = { noremap = true }
	return vim.tbl_extend("keep", opt, _opt)
end

--- @param mode string
--- @param mappings table<string, any>
function Util.restore_mappings(mode, mappings)
	for key, value in pairs(mappings) do
		if vim.fn.empty(value) == 1 then
			Util.unmap(mode, key)
		else
			vim.fn.mapset(mode, 0, value)
		end
	end
end

--- @param mode string
--- @param keys table<string, any>
--- @param global boolean
--- @return table<string, any>
Util.save_mappings = function(mode, keys, global)
	local mappings = {}
	local buffer_mappings = {}

	for _, key in ipairs(keys) do
		if global then
			local key_arg = vim.fn.maparg(key, mode, 0, 1)
			if key_arg.buffer == 1 then
				buffer_mappings.key = key_arg
				Util.unmap_buffer(0, mode, key)
			end
		end

		mappings[key] = vim.fn.maparg(key, mode, 0, 1)

		if global then
			Util.restore_mappings(mode, buffer_mappings)
		end
	end

	return mappings
end

return Util
