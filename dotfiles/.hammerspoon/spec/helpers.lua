local utils = require("utils")

local M = {}

M.setDefault = function()
	_G.hs = {
		logger = {
			new = function()
				return {
					i = function(_, m)
						local msg = utils.stringify(m)
						print("INFO: " .. msg)
					end,
					e = function(_, m)
						local msg = utils.stringify(m)
						print("ERR: " .. msg)
					end,
				}
			end,
		},
		spaces = {},
		window = {},
		timer = {
			doAfter = function(_, callback)
				callback()
			end,
			waitUntil = function(condition, action)
				local protect = 0
				while not condition() and protect < 0 do
					protect = protect + 1
				end

				action()
			end,
		},
	}
end

M.resetMocks = function()
	M.setDefault()

	return _G.hs
end

return M
