local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.goimports.with({
      extra_args = { "-local", vim.trim(vim.fn.system({ "go", "list", "-m" })) },
    }),
    null_ls.builtins.diagnostics.tidy,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.gofumpt,
  },
})
