MappingHelper = {
  enabled = false,
  keys = {},
  mappings = {},
  saved_mappings = {},
}

function MappingHelper:new(m)
  m = m or {}
  setmetatable(m, self)
  self.__index = self
  return m
end

function MappingHelper:activate()
  self.enabled = true

  for mode, keys in pairs(self.keys) do
    self.saved_mappings[mode] = util.save_mappings(mode, keys, true)
  end

  for _, value in ipairs(self.mappings) do
    util.map(value[1], value[2], value[3], value[4])
  end
end

function MappingHelper:restore()
  self.enabled = false

  for mode, saved in pairs(self.saved_mappings) do
    util.restore_mappings(mode, saved)
  end
  self.saved_mappings = {}
end

function MappingHelper:toggle()
  if self.enabled then
    self:restore()
  else
    self:activate()
  end
end

--- @param mappings table<table<string>> each element is a table like {"n", "lhs", "rhs", {}}
local function new_mappings(mappings)
  local m = MappingHelper:new({})
  for index, mapping in ipairs(mappings) do
    local mode = mapping[1]
    local key = mapping[2]

    if m.keys[mode] == nil then
      m.keys[mode] = {}
    end

    table.insert(m.keys[mode], key)

    m.mappings[index] = mapping
  end

  return m
end

---@diagnostic disable-next-line: lowercase-global
mapping_helper = {
  new_mappings = new_mappings,
}

return mapping_helper
