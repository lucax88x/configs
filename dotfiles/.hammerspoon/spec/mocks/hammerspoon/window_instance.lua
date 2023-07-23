local Window = {}

function Window:new(application)
	local item = {
		application_instance = application,
	}

	setmetatable(item, self)
	self.__index = self
	return item
end

function Window:application()
	return self.application_instance
end

return Window
