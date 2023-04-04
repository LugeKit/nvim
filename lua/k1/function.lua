local utils = require("k1.utils")
local map = utils.map
local opts = utils.opts

local M = {}

vim.g.k1_toggle_term = -1
function M.toggle_term()
    if vim.g.k1_toggle_term == -1 then
        vim.cmd [[
        tabnew
        terminal
        normal! a
        ]]
        vim.g.k1_toggle_term = vim.api.nvim_get_current_buf()
    end
end

local function isTermBufferExist()
    -- if vim.g.k1_toggle_term == -1 then
    --     return false
    -- end

    local buf_list = vim.api.nvim_list_bufs()
    local buf_names = {}
    for _, v in ipairs(buf_list) do
        if vim.api.nvim_buf_is_valid(v) then
            table.insert(buf_names, vim.api.nvim_buf_get_name(v))
        end
    end
    vim.print(vim.inspect(buf_names))
end

-- test helper
map("n", "<leader>kkk", "", opts({
    callback = isTermBufferExist,
}))

return M
