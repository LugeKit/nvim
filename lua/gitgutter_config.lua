vim.g.gitgutter_map_keys = 0
local wk = require("which-key")
local keymap = {
	name = "GitGutter",
	p = { "<cmd>GitGutterPreviewHunk<CR>", "Preview Hunk" },
	u = { "<cmd>GitGutterUndoHunk<CR>", "Undo Hunk" },
	["]"] = { "<cmd>GitGutterNextHunk<CR>", "Next Hunk" },
	["["] = { "<cmd>GitGutterPrevHunk<CR>", "Prev Hunk" },
}

wk.register({ h = keymap }, { prefix = "<leader>" })
