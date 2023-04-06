local dapui = require("dapui")

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
