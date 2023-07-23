local WindowBuilder = {}

local args = require("spec.arguments")

function WindowBuilder:new()
	local item = {
		getTable = {},
		get = function(windowId)
			return self.getTable[windowId]
		end,

		allWindowsMatcher = nil,
		allWindows = args.create(self.allWindowsMatcher),
	}

	setmetatable(item, self)
	self.__index = self
	return item
end

function WindowBuilder:withWindow(windowId, window)
	self.getTable[windowId] = window or {}
	return self
end

function WindowBuilder:withAllWindows(matcher)
	args.verify(self.allWindowsMatcher)
	self.allWindows = matcher
	return self
end

function WindowBuilder:build()
	return self:new()
end

return WindowBuilder
