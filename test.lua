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
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
})

local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

luasnip.config.set_config({
	region_check_events = "InsertEnter",
	delete_check_events = "InsertLeave",
})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	preselect = cmp.PreselectMode.None,
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-b>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.scroll_docs(-4)
			else
				fallback()
			end
		end, { "i" }),
		["<C-f>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.scroll_docs(4)
			else
				fallback()
			end
		end, { "i" }),
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "c" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "c" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i" }),
		["<C-e>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.abort()
			else
				fallback()
			end
		end, { "i", "c" }),
		["<CR>"] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() then
					cmp.confirm({ select = true })
				else
					fallback()
				end
			end,
			c = function(fallback)
				if cmp.visible() and cmp.get_active_entry() then
					cmp.confirm({ select = false })
				else
					fallback()
				end
			end,
		}),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", priority = 4 },
		{ name = "luasnip", priority = 2 },
	}),
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.gopls.setup({
	capabilities = capabilities,
})
