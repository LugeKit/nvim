---@diagnostic disable: param-type-mismatch, undefined-field
local map = vim.keymap.set
local unmap = vim.api.nvim_del_keymap
local unmap_buffer = vim.api.nvim_buf_del_keymap

local _opt = { noremap = true, nowait = true, silent = true }
--- @param opt? table<string, any>
local function opts(opt)
  opt = opt or {}
  return vim.tbl_extend("keep", opt, _opt)
end

--- @param dicts table<table<any>> sth. like: {{"n", "o", "<cmd>hello world<cr>", {}}}
local function map_with_dicts(dicts)
  for _, dict in ipairs(dicts) do
    map(dict[1], dict[2], dict[3], dict[4])
  end
end

--- @param mode string
--- @param mappings table<string, any>
local function restore_mappings(mode, mappings)
  for key, value in pairs(mappings) do
    if vim.fn.empty(value) == 1 then
      util.unmap(mode, key)
    else
      vim.fn.mapset(mode, 0, value)
    end
  end
end

--- @param mode string
--- @param keys table<string, any>
--- @param global boolean
--- @return table<string, any>
local function save_mappings(mode, keys, global)
  local mappings = {}
  local buffer_mappings = {}

  for _, key in ipairs(keys) do
    if global then
      local key_arg = vim.fn.maparg(key, mode, 0, 1)
      if key_arg.buffer == 1 then
        buffer_mappings.key = key_arg
        util.unmap_buffer(0, mode, key)
      end
    end

    mappings[key] = vim.fn.maparg(key, mode, 0, 1)

    if global then
      util.restore_mappings(mode, buffer_mappings)
    end
  end

  return mappings
end

local function inspect(arg)
  print(vim.inspect(arg))
  vim.cmd([[messages]])
end

---@param prompt string
---@param callback function ((string|nil) -> ())
local function require_input_with_ui(prompt, callback)
  return vim.ui.input({
    prompt = prompt,
  }, callback)
end

---@diagnostic disable-next-line: lowercase-global
util = {
  map = map,
  map_with_dicts = map_with_dicts,
  unmap = unmap,
  unmap_buffer = unmap_buffer,
  opts = opts,
  restore_mappings = restore_mappings,
  save_mappings = save_mappings,
  inspect = inspect,
  require_input_with_ui = require_input_with_ui,
}

return util
