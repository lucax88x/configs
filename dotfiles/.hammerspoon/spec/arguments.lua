local M = {}

M.verify = function(pointer)
	if pointer ~= nil then
		error("matcher already set, use only one!")
	end
end

M.create = function(matcher)
	return function(...)
		if matcher == nil then
			return nil
		end

		return matcher(...)
	end
end

return M
