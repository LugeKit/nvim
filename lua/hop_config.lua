local util = require("k1.util")
local hop = require("hop")
local directions = require("hop.hint").HintDirection

hop.setup({})

local keymap = {
  { "", "f", function() hop.hint_char1({ direction = nil, current_line_only = true }) end, util.opts() },
  { "", "t", function() hop.hint_char1({ direction = nil, current_line_only = true, hint_offset = -1 }) end,
    util.opts() },
  { "", "<leader>j", function() hop.hint_lines_skip_whitespace({ direction = directions.AFTER_CURSOR }) end,
    util.opts({ desc = "Hop-j" }) },
  { "", "<leader>k", function() hop.hint_lines_skip_whitespace({ direction = directions.BEFORE_CURSOR }) end,
    util.opts({ desc = "Hop-k" }) },
}

util.map_with_dicts(keymap)
util.unmap("s", "f")
util.unmap("s", "t")
util.unmap("s", "<leader>j")
util.unmap("s", "<leader>k")
