local wk = require("which-key")
local builtin = require("telescope.builtin")
local action = require("telescope.actions")
local util = require("k1.util")

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = action.move_selection_next,
        ["<C-k>"] = action.move_selection_previous,
        ["<Esc>"] = action.close,
      },
    },
  },
})

local function call_with_glob(callback)
  return function()
    util.require_input_with_ui("File Pattern", callback)
  end
end

local function live_grep_glob(input)
  if input and string.len(input) > 0 then
    builtin.live_grep({
      glob_pattern = input,
    })
  end
end

local function find_files_glob(input)
  if input and string.len(input) > 0 then
    builtin.find_files({
      glob_pattern = input,
    })
  end
end

local function find_references()
  builtin.lsp_references({
    include_declaration = false,
    include_current_line = true,
    show_line = false,
  })
end

local function find_implementations()
  builtin.lsp_implementations({
    show_line = false,
  })
end

wk.register({
  f = {
    name = "Telescope",
    f = { "<cmd>Telescope find_files<CR>", "Find File" },
    F = { call_with_glob(find_files_glob), "Find File(Glob)" },
    a = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Dynamic Symbols" },
    s = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
    S = { call_with_glob(live_grep_glob), "Live Grep(Glob)" },
    i = { find_implementations, "Find Implementations" },
    r = { find_references, "Find References" },
  },
}, { prefix = "<leader>" })
