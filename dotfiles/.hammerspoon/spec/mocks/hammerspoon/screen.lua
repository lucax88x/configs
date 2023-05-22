local ScreenBuilder = {}

function ScreenBuilder:new()
  local item = {
    mainScreenId = nil,

    mainScreen = function()
      return {
        id = function()
          return self.mainScreenId
        end,
      }
    end,
  }
  setmetatable(item, self)
  self.__index = self
  return item
end

function ScreenBuilder:withMainScreen(mainScreenId)
  self.mainScreenId = mainScreenId
  return self
end

function ScreenBuilder:build()
  return self:new()
end

return ScreenBuilder
