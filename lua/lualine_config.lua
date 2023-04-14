require("lualine").setup({
  options = {
    icons_enabled = false,
  },
  sections = {
    lualine_c = {
      "lsp_progress",
    },
    lualine_x = {
    },
    lualine_y = {
      "encoding", "filetype",
    },
    lualine_z = {
      "%l/%L",
    }
  },
  tabline = {
    lualine_a = {
      {
        "tabs",
        mode = 3,
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
