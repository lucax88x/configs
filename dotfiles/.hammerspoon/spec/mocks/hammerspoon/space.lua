local SpaceBuilder = {}

local args = require("spec.arguments")

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

		windowsForSpaceTable = {},
		windowsForSpace = function(spaceId)
			return self.windowsForSpaceTable[spaceId]
		end,

		gotoSpaceResult = { nil, nil },
		gotoSpace = function()
			return self.gotoSpaceResult[1], self.gotoSpaceResult[2]
		end,

		removeSpaceMatcher = nil,
		removeSpace = args.create(self.removeSpaceMatcher),
	}

	setmetatable(item, self)
	self.__index = self
	return item
end

function SpaceBuilder:withSpacesForScreen(screenId, spacesForScreen)
	self.spacesForScreenTable[screenId] = spacesForScreen
	return self
end

function SpaceBuilder:withFocusedSpace(focusedSpaceId)
	self.focusedSpaceId = focusedSpaceId
	return self
end

function SpaceBuilder:withWindowsForSpace(spaceId, windowIds)
	self.windowsForSpaceTable[spaceId] = windowIds
	return self
end

function SpaceBuilder:withGotoSpace(result, error)
	self.gotoSpaceResult = { result, error }
	return self
end

function SpaceBuilder:withRemoveSpace(matcher)
	args.verify(self.removeSpaceMatcher)
	self.removeSpaceMatcher = matcher
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
