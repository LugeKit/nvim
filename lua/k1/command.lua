local group = vim.api.nvim_create_augroup("my_group", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "FocusGained", "BufEnter" }, {
    group = group,
    pattern = "*",
    command = "checktime",
})

autocmd({ "FocusGained", "BufEnter" }, {
    group = group,
    pattern = "*",
    callback = function()
        local api = require("nvim-tree.api")
        if api == nil then
            return
        end

        -- TODO@k1 check whether nvim-tree exist or not?
        api.tree.reload()
    end
})

autocmd({ "BufReadPost" }, {
    group = group,
    pattern = "*.log",
    command = "normal G",
})
