local utils = require("utils")
local yabai = require("yabai.api")
local log = hs.logger.new("mine", "info")

local M = { display = {}, space = {}, window = {} }

function M.purge_empty_spaces(callback)
  yabai.space.get(function(spaces)
    local to_destroy_ids = {}

    for _, space in pairs(spaces) do
      if utils.is_empty(space.label) then
        table.insert(to_destroy_ids, space.id)
      end
    end

    utils.sequential(to_destroy_ids, function(to_find_space_id, next)
      yabai.space.get(function(loop_spaces)
        local found_space = utils.first(loop_spaces, function(space)
          return space.id == to_find_space_id
        end)

        if found_space == nil then
          log.i("cannot find space with id " .. to_find_space_id)
          next()
        else
          local space_index = found_space.index

          local is_native_fullscreen = found_space["is-native-fullscreen"]

          if not is_native_fullscreen then
            log.i("destroying space with id " .. found_space.id .. " index " .. space_index)

            yabai.space.destroy(space_index, function(error)
              if not utils.is_empty(error) then
                log.i(error)
              else
                log.i("destroyed space with index " .. space_index)
              end

              next()
            end)
          else
            log.i("skipping space with id " .. found_space.id .. " because full screen")
            next()
          end
        end
      end)
    end, function()
      if callback then
        callback()
      end
    end)
  end)
end

return M
