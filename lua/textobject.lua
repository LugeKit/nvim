local c = require("nvim-treesitter.configs")

c.setup({
  textobjects = {
    move = {
      enable = true,
      set_jumps = false,
      goto_next_start = {
        ["]f"] = { query = "@function.outer", desc = "Next Function Start" },
        ["]c"] = { query = "@class.outer", desc = "Next Class Start" },
      }
    }
  }
})
