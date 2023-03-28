local keymap = {
	name = "Debug",
	["<F5>"] = { "<cmd>DapContinue<CR>", "Continue" },
	["<F6>"] = { "<cmd>DapStepOver<CR>", "Step Over" },
	["<F7>"] = { "<cmd>DapStepInto<CR>", "Step Into" },
	["<F8>"] = { "<cmd>DapStepOut<CR>", "Step Out" },
	b = { "<cmd>DapToggleBreakPoint<CR>", "Toggle Breakpoint" },
	r = { "<cmd>DapToggleRepl<CR>", "Toggle Repl" },
}

local wk = require("which-key")
wk.register({ d = keymap }, { prefix = "<leader>" })
