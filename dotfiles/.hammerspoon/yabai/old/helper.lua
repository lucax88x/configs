local utils = require("utils")
local yabai = require("yabai.api")
local log = hs.logger.new("yabai.helper", "info")

local M = { display = {}, space = {}, window = {} }

function M.purge_empty_spaces(callback)
	yabai.space.get_all(function(error, spaces)
		if not utils.is_empty(error) then
			callback(error, nil)
			return
		end

		table.sort(spaces, function(left_space, right_space)
			return left_space.index > right_space.index
		end)

		utils.sequential(spaces, function(space, next)
			local is_native_fullscreen = space["is-native-fullscreen"]
			local has_label = not utils.is_empty(space.label)

			local window_has_only_teams_notification = utils.length(space.windows) == 1 and space.windows[1] == 1371
			local has_windows = utils.length(space.windows) > 0

			if is_native_fullscreen then
				next("skipping space with id " .. space.id .. " because full screen", nil)
			else
				if has_label then
					next("skipping space with id " .. space.id .. " because has label " .. space.label, nil)
				else
					if has_windows and not window_has_only_teams_notification then
						next("skipping space with id " .. space.id .. " has windows", nil)
					else
						yabai.space.destroy(space.index, function(destroy_error)
							if not utils.is_empty(destroy_error) then
								log.e(destroy_error)
								next(destroy_error, nil)
							else
								next(nil, "destroyed space with index " .. space.index)
							end
						end)
					end
				end
			end
		end, callback)
	end)
end

return M
