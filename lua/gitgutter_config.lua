vim.g.gitgutter_map_keys = 0
local wk = require("which-key")
local keymap = {
    name = "GitGutter",
    p = { "<cmd>GitGutterPreviewHunk<CR>", "Preview Hunk" },
    u = { "<cmd>GitGutterUndoHunk<CR>", "Undo Hunk" },
    ["n"] = { "<cmd>GitGutterNextHunk<CR>", "Next Hunk" },
    ["N"] = { "<cmd>GitGutterPrevHunk<CR>", "Prev Hunk" },
}

wk.register({ g = keymap }, { prefix = "<leader>" })
