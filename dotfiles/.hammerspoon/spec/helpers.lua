local utils = require("utils")

local M = {}

M.setDefault = function()
	_G.hs = {
		logger = {
			new = function()
				return {
					i = function(m)
						local msg = utils.stringify(m)
						print("INFO: " .. msg)
					end,
				}
			end,
		},
		spaces = {},
		window = {},
	}
end

M.resetMocks = function()
	M.setDefault()

	return _G.hs
end

return M
