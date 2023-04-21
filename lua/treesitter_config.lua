local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  textobjects = {
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = { query = "@function.outer", desc = "Next function start" },
        ["]c"] = { query = "@class.outer", desc = "Next class start" },
        ["]p"] = { query = "@parameter.inner", desc = "Next parameter start" },
      }
    },
  }
})
