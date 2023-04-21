local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "neovim/nvim-lspconfig",

  -- syntax highlight
  { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- lsp server managment
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- debugger
  "mfussenegger/nvim-dap",
  "leoluz/nvim-dap-go",
  "rcarriga/nvim-dap-ui",

  -- test helper, one command to run test
  "vim-test/vim-test",

  -- all about auto completion
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/nvim-cmp",
  "ray-x/lsp_signature.nvim",
  "folke/neodev.nvim",

  -- snippets for expand completion and more
  "L3MON4D3/LuaSnip",

  -- automated tags
  "weilbith/nvim-lsp-smag",

  "folke/tokyonight.nvim",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  -- git enhancement
  "airblade/vim-gitgutter",
  "tpope/vim-fugitive",

  -- finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- status line
  "nvim-lualine/lualine.nvim",
  "arkav/lualine-lsp-progress",

  -- show shortcuts in floating view
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 600
      require("which-key").setup({})
    end,
  },
  -- lsp linter, dignostics, formatter and more
  "jose-elias-alvarez/null-ls.nvim",

  -- pair helper, auto complete pairs
  "windwp/nvim-autopairs",

  -- ui enhancement
  "stevearc/dressing.nvim",

  -- floating terminal
  "voldikss/vim-floaterm",

  "aznhe21/hop.nvim",
})

-- user configs
require("mason").setup({})
require("mason-lspconfig").setup({})
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
}) -- before lspconfig
require("k1").setup()
require("lualine_config")
require("dap_config")
require("telescope_config")
require("theme_config")
require("nvimtree_config")
require("gitgutter_config")
require("vim_test_config")
require("which_key_config")
require("null_ls_config")
require("nvim-autopairs").setup({})
require("treesitter_config")
require("lsp_config")
require("dressing_config")
require("floaterm_config")
require("hop_config")
