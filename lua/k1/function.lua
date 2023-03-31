local utils = require("k1.utils")
local map = utils.map
local opts = utils.opts

local M = {}

function M.setup()
	map(
		"n",
		"<leader>g",
		"",
		opts({
			callback = function()
				local curr_file = vim.fn.expand("%")
				print(curr_file)
			end,
		})
	)
end

return M
