local WindowBuilder = {}

function WindowBuilder:new()
  local item = {
    getTable = {},
    get = function(windowId)
      return self.getTable[windowId]
    end,
  }

  setmetatable(item, self)
  self.__index = self
  return item
end

function WindowBuilder:withWindow(windowId, window)
  self.getTable[windowId] = window or {}
  return self
end

function WindowBuilder:build()
  return self:new()
end

return WindowBuilder
