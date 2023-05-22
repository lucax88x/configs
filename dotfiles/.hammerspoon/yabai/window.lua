local utils = require("utils")
local ensure = require("yabai.shared").ensure
local yabai = require("yabai.shared").yabai

local M = {}

function M.toggle_float(callback)
  yabai({ "-m", "window", "--toggle", "float" }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      yabai({ "-m", "window", "--grid", "4:4:1:1:2:2" }, function(_, gridError)
        if not utils.is_empty(gridError) then
          ensure(callback, gridError, nil)
        else
          ensure(callback, nil, nil)
        end
      end)
    end
  end)
end

return M
