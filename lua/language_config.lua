local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local masonlsp = require("mason-lspconfig")

masonlsp.setup({
  ensure_installed = {
    "gopls",
    "lua_ls",
    "vimls",
    "bashls",
    "clangd",
    "pyright",
    "tsserver",
    "html",
    "cssls",
  }
})

lspconfig.gopls.setup({
  capabilities = capabilities,
})
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
lspconfig.vimls.setup({
  capabilities = capabilities,
})
lspconfig.bashls.setup({
  capabilities = capabilities,
})
lspconfig.clangd.setup({
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp" },
})
lspconfig.pyright.setup({
  capabilities = capabilities,
})
lspconfig.tsserver.setup({
  capabilities = capabilities
})
lspconfig.html.setup({
  capabilities = capabilities
})
lspconfig.cssls.setup({
  capabilities = capabilities
})
