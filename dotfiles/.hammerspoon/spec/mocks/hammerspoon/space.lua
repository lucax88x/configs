local SpaceBuilder = {}

function SpaceBuilder:new()
  local item = {
    allSpacesResult = {},
    allSpaces = function()
      return self.allSpacesResult
    end,

    spacesForScreenTable = {},
    spacesForScreen = function(screenId)
      return self.spacesForScreenTable[screenId]
    end,

    focusedSpaceId = nil,
    focusedSpace = function()
      return self.focusedSpaceId
    end,

    gotoSpaceResult = { nil, nil },
    gotoSpace = function()
      return self.gotoSpaceResult[1], self.gotoSpaceResult[2]
    end,

    removeSpaceResult = { nil, nil },
    removeSpace = function()
      return self.removeSpaceResult[1], self.removeSpaceResult[2]
    end,
  }

  setmetatable(item, self)
  self.__index = self
  return item
end

function SpaceBuilder:withSpacesForScreen(screenId, spacesForScreen)
  self.spacesForScreenTable[screenId] = spacesForScreen
  return self
end

function SpaceBuilder:withFocusedSpace(spaceId)
  self.focusedSpaceId = spaceId
  return self
end

function SpaceBuilder:withGotoSpace(result, error)
  self.gotoSpaceResult = { result, error }
  return self
end

function SpaceBuilder:withRemoveSpace(result, error)
  self.removeSpaceResult = { result, error }
  return self
end

function SpaceBuilder:withAllSpaces(table)
  self.allSpacesResult = table
  return self
end

function SpaceBuilder:build()
  return self:new()
end

return SpaceBuilder
