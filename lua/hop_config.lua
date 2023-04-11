local util = require("k1.util")
local hop = require("hop")
local directions = require("hop.hint").HintDirection

hop.setup({})

local keymap = {
  { "n", "f", function() hop.hint_char1({ direction = nil, current_line_only = true }) end, util.opts() },
  { "o", "f", function() hop.hint_char1({ direction = nil, current_line_only = true }) end, util.opts() },
  { "n", "t", function() hop.hint_char1({ direction = nil, current_line_only = true, hint_offset = -1 }) end,
    util.opts() },
  { "o", "t", function() hop.hint_char1({ direction = nil, current_line_only = true, hint_offset = -1 }) end,
    util.opts() },
  { "n", "<leader>j", function() hop.hint_lines_skip_whitespace({ direction = directions.AFTER_CURSOR }) end, util.opts() },
  { "o", "<leader>j", function() hop.hint_lines_skip_whitespace({ direction = directions.AFTER_CURSOR }) end, util.opts() },
  { "n", "<leader>k", function() hop.hint_lines_skip_whitespace({ direction = directions.BEFORE_CURSOR }) end,
    util.opts() },
  { "o", "<leader>k", function() hop.hint_lines_skip_whitespace({ direction = directions.BEFORE_CURSOR }) end,
    util.opts() },
}

util.map_with_dicts(keymap)
