local Term = {}

local toggle_term_enabled = true
local toggle_term_buffer_id = -1
function Term.toggle_term()
	if !toggle_term_enabled then
		vim.cmd([[
        tabnew
        terminal
        normal! a
        ]])
		toggle_term_buffer_id = vim.api.nvim_get_current_buf()
	end
end

local function isTermBufferExist()
  if !toggle_term_enabled then
    return false
  end

	local buf_list = vim.api.nvim_list_bufs()
	local buf_names = {}
	for _, v in ipairs(buf_list) do
		if vim.api.nvim_buf_is_valid(v) then
			table.insert(buf_names, vim.api.nvim_buf_get_name(v))
		end
	end
	vim.print(vim.inspect(buf_names))
end

return Term
