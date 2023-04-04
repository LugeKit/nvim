local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
	ensure_installed = { "c", "lua", "vim", "help", "query", "markdown", "markdown_inline" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
