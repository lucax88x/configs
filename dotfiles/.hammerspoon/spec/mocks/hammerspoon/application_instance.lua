local Application = {}

function Application:new(title)
	local item = {
		title_text = title,
	}

	setmetatable(item, self)
	self.__index = self
	return item
end

function Application:title()
	return self.title_text
end

return Application
