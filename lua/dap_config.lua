local dapui = require("dapui")

local current_layout_id = 0

local function open_target_layout_only(layout_id)
	return function()
		current_layout_id = layout_id
		dapui.close()
		dapui.open({
			layout = layout_id,
		})
	end
end

local function reset_current_layout()
	return function()
		if current_layout_id <= 0 then
			return
		end
		dapui.close()
		dapui.open({
			layout = current_layout_id,
			reset = true,
		})
	end
end

local keymap = {
	d = {
		name = "Debug",
		c = { "<cmd>DapContinue<CR>", "Continue" },
		n = { "<cmd>DapStepOver<CR>", "Step Over" },
		i = { "<cmd>DapStepInto<CR>", "Step Into" },
		o = { "<cmd>DapStepOut<CR>", "Step Out" },
		r = { "<cmd>lua require('dap').run_to_cursor()<CR>", "Run To Cursor" },
		b = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
		B = {
			"<cmd>lua require('dap').toggle_breakpoint(vim.fn.input '[Condition] > ')<CR>",
			"Toggle Breakpoint(Condition)",
		},
		l = { "<cmd>lua require('dapui').float_element('breakpoints', { enter = true })<CR>", "Breakpoints List" },
		D = { "<cmd>lua require('dap').clear_breakpoints()<CR>", "Clear Breakpoints" },
		x = { "<cmd>DapTerminate<CR>", "Terminate" },
		e = { "<cmd>lua require('dapui').eval(vim.fn.input '[Expression] > ', { enter = true })<CR>", "Evaluate" },
		w = { "<cmd>lua require('dapui').elements.watches.add(vim.fn.expand '<cword>')<CR>", "Watches Add" },
		W = {
			"<cmd>lua require('dapui').elements.watches.add(vim.fn.input '[Watch] > ', { enter = true })<CR>",
			"Watches Add(Input)",
		},
		k = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Hover" },
		["1"] = { open_target_layout_only(1), "Open Dapui Layout 1" },
		["2"] = { open_target_layout_only(2), "Open Dapui Layout 2" },
		["3"] = { open_target_layout_only(3), "Open Dapui Layout 3" },
		L = { reset_current_layout(), "Reset Current Layout" },
	},
}

local keymap_v = {
	d = {
		name = "Debug",
		e = { "<cmd>lua require('dapui').eval()<CR>", "Evaluate" },
	},
}

local wk = require("which-key")
wk.register(keymap, { prefix = "<leader>" })
wk.register(keymap_v, { mode = "v", prefix = "<leader>" })

-- language configuration
require("dap-go").setup({})

-- ui configuration
dapui.setup({
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<C-c>", "<Esc>" },
		},
	},
	layouts = {
		{
			elements = {
				{
					id = "scopes",
					size = 0.5,
				},
				{
					id = "watches",
					size = 0.5,
				},
			},
			position = "left",
			size = 50,
		},
		{
			elements = {
				{
					id = "repl",
					size = 0.5,
				},
				{
					id = "console",
					size = 0.5,
				},
			},
			position = "left",
			size = 50,
		},
		{
			elements = {
				{
					id = "stack",
					size = 0.5,
				},
				{
					id = "breakpoints",
					size = 0.5,
				},
			},
			position = "left",
			size = 50,
		},
	},
})

local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
	current_layout_id = 1
	dapui.open({
		layout = 1,
		reset = true,
	})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	current_layout_id = 0
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	current_layout_id = 0
	dapui.close()
end
