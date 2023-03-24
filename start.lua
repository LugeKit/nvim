local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
	"neovim/nvim-lspconfig",
	{ "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
	"folke/neodev.nvim",

	{
		"glepnir/lspsaga.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	"williamboman/mason.nvim",
	"mfussenegger/nvim-dap",
	"leoluz/nvim-dap-go",
	"rcarriga/nvim-dap-ui",

	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",

	"folke/tokyonight.nvim",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"airblade/vim-gitgutter",

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" }
	},

	"nvim-lualine/lualine.nvim",
}

-- user configs
require("mason").setup {}
require("neodev").setup {} -- before lspconfig
require("lualine_config")
require("cmp_config")
require("treesitter_config")
require("lsp_mappings_config")
require("lspsaga_config")
require("dap_config")
require("dap-go").setup {}
require("telescope_config")
require("theme_config")
require("nvimtree_config")
require("gitgutter_config")
require("language_config")
