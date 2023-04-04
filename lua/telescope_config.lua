require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
			},
		},
	},
})

local function call_with_glob(callback)
	return function()
		vim.ui.input({
			prompt = "Please enter glob: ",
		}, callback)
	end
end

local function live_grep_glob(input)
	require("telescope.builtin").live_grep({
		glob_pattern = input,
	})
end

local function find_files_glob(input)
	require("telescope.builtin").find_files({
		glob_pattern = input,
	})
end

local wk = require("which-key")
wk.register({
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<CR>", "Find File" },
		F = { call_with_glob(find_files_glob), "Find File(Glob)" },
		d = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Workspace Symbols" },
		D = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Dynamic Symbols" },
		s = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
		S = { call_with_glob(live_grep_glob), "Live Grep(Glob)" },
		a = { "<cmd>Telescope git_status<CR>", "Git Status" },
	},
}, { prefix = "<leader>" })
