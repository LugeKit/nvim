local dapui = require("dapui")
local wk = require("which-key")
local dap = require("dap")

-- language configuration
require("dap-go").setup({})

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

---@param prompt string
---@param callback function ((string|nil) -> ())
local function require_input(prompt, callback)
  return vim.ui.input({
    prompt = prompt,
  }, callback)
end

local function dapui_eval()
  require_input("Evaluate", function(input)
    if input and string.len(input) > 0 then
      dapui.eval(input)
    end
  end)
end

local function dapui_watch_add()
  require_input("Watch", function(input)
    if input and string.len(input) > 0 then
      dapui.elements.watches.add(input)
    end
  end)
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
    e = { dapui_eval, "Evaluate" },
    w = { "<cmd>lua require('dapui').elements.watches.add(vim.fn.expand '<cword>')<CR>", "Watches Add" },
    W = { dapui_watch_add, "Watches Add(Input)" },
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

wk.register(keymap, { prefix = "<leader>" })
wk.register(keymap_v, { mode = "v", prefix = "<leader>" })

-- local keymap_k1 = {
--   {
--     "n",
--     "<leader>c",
--     "<cmd>DapContinue<CR>",
--     util.opts({
--       desc = "Continue",
--     }),
--   },
--   { "n", "<leader>n", "<cmd>DapStepOver<CR>",                           util.opts({ desc = "Step Over" }) },
--   { "n", "<leader>i", "<cmd>DapStepInto<CR>",                           util.opts({ desc = "Step Into" }) },
--   { "n", "<leader>o", "<cmd>DapStepOut<CR>",                            util.opts({ desc = "Step Out" }) },
--   { "n", "<leader>r", "<cmd>lua require('dap').run_to_cursor()<CR>",    util.opts({ desc = "Run To Cursor" }) },
--   { "n", "<leader>b", "<cmd>DapToggleBreakpoint<CR>",                   util.opts({ desc = "Toggle Breakpoint" }) },
--   { "n", "<leader>k", "<cmd>lua require('dap.ui.widgets').hover()<CR>", util.opts({ desc = "Hover" }) },
--   {
--     "n",
--     "<leader>B",
--     "<cmd>lua require('dap').toggle_breakpoint(vim.fn.input '[Condition] > ')<CR>",
--     util.opts({ desc = "Toggle Breakpoint(Condition)" }),
--   },
--   {
--     "n",
--     "<leader>l",
--     "<cmd>lua require('dapui').float_element('breakpoints', { enter = true })<CR>",
--     util.opts({ desc = "Breakpoints List" }),
--   },
--   {
--     "n",
--     "<leader>D",
--     "<cmd>lua require('dap').clear_breakpoints()<CR>",
--     util.opts({ desc = "Clear Breakpoints" }),
--   },
--   {
--     "n",
--     "<leader>x",
--     "<cmd>DapTerminate<CR>",
--     util.opts({ desc = "Terminate" }),
--   },
--   {
--     "n",
--     "<leader>e",
--     "<cmd>lua require('dapui').eval(vim.fn.input '[Expression] > ', { enter = true })<CR>",
--     util.opts({ desc = "Evaluate" }),
--   },
--   {
--     "n",
--     "<leader>w",
--     "<cmd>lua require('dapui').elements.watches.add(vim.fn.expand '<cword>')<CR>",
--     util.opts({ desc = "Watches Add" }),
--   },
--   {
--     "n",
--     "<leader>W",
--     "<cmd>lua require('dapui').elements.watches.add(vim.fn.input '[Watch] > ', { enter = true })<CR>",
--     util.opts({ desc = "Watches Add(Input)" }),
--   },
-- }
-- local keymap_storage = mapping_helper.new_mappings(keymap_k1)

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
