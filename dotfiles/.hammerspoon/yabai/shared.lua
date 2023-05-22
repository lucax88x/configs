local tasker = require("tasker")

local M = {}

function M.yabai(args, callback)
	return tasker.run("/opt/homebrew/bin/yabai", args, callback)
end

function M.ensure(callback, error, result)
	if callback ~= nil then
		callback(error, result)
	end
end

return M
