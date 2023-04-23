local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.goimports.with({
      extra_args = { "-local", vim.trim(vim.fn.system({ "go", "list", "-m" })) },
    }),
  },
})
