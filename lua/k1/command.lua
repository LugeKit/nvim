local group = vim.api.nvim_create_augroup('my_group', {clear=true})
local autocmd = vim.api.nvim_create_autocmd

autocmd({'FocusGained', 'BufEnter'}, {
    group = group,
    pattern = "*",
    command = "checktime",
})

autocmd({'BufReadPost'}, {
    group = group,
    pattern = "*.log",
    command = "normal G",
})
