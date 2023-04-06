---@diagnostic disable: param-type-mismatch, undefined-field
local map = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap
local unmap_buffer = vim.api.nvim_buf_del_keymap

--- @param opt? table<string, any>
local function opts(opt)
  local _opt = { noremap = true, nowait = true, silent = true }
  return vim.tbl_extend("keep", opt, _opt)
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

---@diagnostic disable-next-line: lowercase-global
util = {
  map = map,
  unmap = unmap,
  unmap_buffer = unmap_buffer,
  opts = opts,
  restore_mappings = restore_mappings,
  save_mappings = save_mappings,
  inspect = inspect,
}

return util
