require("language_config")
require("lspsaga_config")
require("cmp_config")
local util = require("k1.util")
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    local opts = function(opt)
      local _opt = { buffer = ev.buf }
      return vim.tbl_extend("keep", opt, _opt)
    end

    -- use vim.lsp.buf.definition and type_definition because of following two reasons
    -- 1. It is easy to jump back via <C-o> (while lspsaga finder cannot)
    -- 2. It can go inside std lib (while telescope.builtin.lsp_definitions cannot)
    -- TODO@k1 in the future, try to implement a telescope extension as lsp_finder (including references, definitions, etc.)
    local keymap = {
      { "n", "<leader>rn", vim.lsp.buf.rename,                        opts({ desc = "Rename" }) },
      { "n", "<leader>ca", vim.lsp.buf.code_action,                   opts({ desc = "Code Action" }) },
      { "n", "<leader>fd", "<cmd>lua vim.lsp.buf.definition()<CR>zz", opts({ desc = "Go To Definition" }) },
      {
        "n",
        "<leader>fD",
        "<cmd>lua vim.lsp.buf.type_definition()<CR>zz",
        opts({ desc = "Go To Type Definition" }),
      },
    }
    util.map_with_dicts(keymap)
  end,
})

local augroup = vim.api.nvim_create_augroup("LspFormat", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function(args)
    vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 1000 })
  end,
})
