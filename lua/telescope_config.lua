local wk = require("which-key")
local builtin = require("telescope.builtin")
local action = require("telescope.actions")

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
    vim.ui.input({ prompt = "File Pattern" }, function(input)
      if input == nil or string.len(input) == 0 then
        return
      end

      local globs = {}
      for arg in string.gmatch(input, "%S+") do
        table.insert(globs, arg)
      end

      callback(globs)
    end)
  end
end

local function live_grep_glob(globs)
  builtin.live_grep({
    glob_pattern = globs,
  })
end

local function find_files_glob(globs)
  builtin.find_files({
    glob_pattern = globs,
  })
end

local function find_references()
  builtin.lsp_references({
    include_declaration = false,
    include_current_line = true,
    fname_width = 200,
    show_line = true,
  })
end

local function find_implementations()
  builtin.lsp_implementations({
    fname_width = 200,
    show_line = true,
  })
end

local function outgoing_calls()
  builtin.lsp_outgoing_calls({
    fname_width = 200,
    show_line = true,
  })
end

local function incoming_calls()
  builtin.lsp_incoming_calls({
    fname_width = 200,
    show_line = true,
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
    c = { outgoing_calls, "Outgoing Calls" },
    C = { incoming_calls, "Incoming Calls" },
    q = { "<cmd>Telescope resume<CR>", "Resume" },
    g = {
      name = "Git",
      g = { "<cmd>Telescope git_status<CR>", "Git Status" },
      f = { "<cmd>Telescope git_bcommits<CR>", "Git Diff Current File" },
    },
  },
}, { mode = "n", prefix = "<leader>" })
