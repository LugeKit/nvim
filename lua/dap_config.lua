local keymap = {
	d = {
		name = "Debug",
		c = { "<cmd>DapContinue<CR>", "Continue" },
		n = { "<cmd>DapStepOver<CR>", "Step Over" },
		i = { "<cmd>DapStepInto<CR>", "Step Into" },
		o = { "<cmd>DapStepOut<CR>", "Step Out" },
		b = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
		B = { "<cmd>lua require('dap').list_breakpoints()<CR>", "List Breakpoints" },
		C = { "<cmd>lua require('dap').clear_breakpoints()<CR>", "Clear Breakpoints" },
		q = { "<cmd>DapToggleRepl<CR>", "Toggle Repl" },
		d = { "<cmd>lua require('dap').disconnect()<CR>", "Disconnect" },
		x = { "<cmd>DapTerminate<CR>", "Terminate" },
		r = { "<cmd>lua require('dap').run_to_cursor()<CR>", "Run To Cursor" },
		e = { "<cmd>lua require('dapui').eval(vim.fn.input '[Expression] > ')<CR>", "Evaluate" },
		h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Hover" },
	},
}

local keymap_v = {
	name = "Debug",
	e = { "<cmd>lua require('dapui').eval()<CR>", "Evaluate" },
}

local wk = require("which-key")
wk.register(keymap, { prefix = "<leader>" })
wk.register(keymap_v, { mode = "v", prefix = "<leader>" })

-- language configuration
require("dap-go").setup({})

-- ui configuration
local dapui = require("dapui")
dapui.setup {}

local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
