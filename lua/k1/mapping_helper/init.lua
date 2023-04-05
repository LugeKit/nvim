mapping_helper = {}

Mapping = {
  keys = {},
  mappings = {},
}

function Mapping:new(m)
  m = m or {}
  setmetatable(m, self)
  self.__index = self
  return m
end

function mapping_helper.new_mapping(mappings)
  local m = Mapping:new({})
  for key, _ in pairs(mappings) do
    table.insert(m.keys, key)
  end
  m.mappings = mappings
  return m
end

return mapping_helper
