local util = require("k1.util")
local hop = require("hop")
local directions = require("hop.hint").HintDirection

hop.setup({})

local keymap = {
  { { "n", "x", "o" }, "f", function() hop.hint_char1({ direction = nil, current_line_only = true }) end, util.opts() },
  { { "n", "x", "o" }, "t",
    function() hop.hint_char1({ direction = nil, current_line_only = true, hint_offset = -1 }) end,
    util.opts() },
  { { "n", "x", "o" }, "T",
    function() hop.hint_char1({ direction = nil, current_line_only = true, hint_offset = 1 }) end,
    util.opts() },
  { { "n", "x", "o" }, "<leader>j",
    function() hop.hint_lines_skip_whitespace({ direction = directions.AFTER_CURSOR }) end,
    util.opts({ desc = "Hop-j" }) },
  { { "n", "x", "o" }, "<leader>k",
    function() hop.hint_lines_skip_whitespace({ direction = directions.BEFORE_CURSOR }) end,
    util.opts({ desc = "Hop-k" }) },
}

util.map_with_dicts(keymap)
