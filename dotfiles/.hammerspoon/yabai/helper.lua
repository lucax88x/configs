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

    utils.sequential(spaces, function(space, next)
      local is_native_fullscreen = space["is-native-fullscreen"]
      local has_windows = utils.length(space.windows) > 0

      if not is_native_fullscreen and not has_windows then
        yabai.space.destroy(space.index, function(destroy_error)
          if not utils.is_empty(destroy_error) then
            log.e(destroy_error)
            next(destroy_error, nil)
          else
            next(nil, "destroyed space with index " .. space.index)
          end
        end)
      else
        next("skipping space with id " .. space.id .. " because full screen or has windows", nil)
      end
    end, callback)
  end)
end

return M
