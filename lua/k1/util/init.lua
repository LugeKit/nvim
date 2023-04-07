---@diagnostic disable-next-line: lowercase-global
util = {}
util.unmap = vim.api.nvim_del_keymap
util.unmap_buffer = vim.api.nvim_buf_del_keymap
util.map = vim.keymap.set

local _opt = { noremap = true, nowait = true, silent = true }
--- @param opt? table<string, any>
util.opts = function(opt)
  opt = opt or {}
  return vim.tbl_extend("keep", opt, _opt)
end

--- @param dicts table<table<any>> sth. like: {{"n", "o", "<cmd>hello world<cr>", {}}}
util.map_with_dicts = function(dicts)
  for _, dict in ipairs(dicts) do
    util.map(dict[1], dict[2], dict[3], dict[4])
  end
end

--- @param mode string
--- @param mappings table<string, any>
util.restore_mappings = function(mode, mappings)
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
util.save_mappings = function(mode, keys, global)
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

util.inspect = function(arg)
  print(vim.inspect(arg))
  vim.cmd([[messages]])
end

---@return string text of the visual selected
util.get_visual_selected = function()
  local a_orig = vim.fn.getreg("a")
  local mode = vim.fn.mode()
  if mode ~= "v" and mode ~= "V" then
    return ""
  end
  vim.cmd([[normal! "agv]])
  local text = vim.fn.getreg("a")
  vim.fn.setreg("a", a_orig)
  return text
end

return util
