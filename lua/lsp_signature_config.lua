local lsp_signature = require("lsp_signature")
lsp_signature.setup({
  bind = true,
  doc_lines = 0,
  floating_window=false,
  handler_opts = {
    border = "single",
  },
  hint_enable = true,
  toggle_key = "<C-p>", -- disable toggle key, because it will conflict with other key mappings
})
