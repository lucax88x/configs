local log = hs.logger.new("mine", "info")
local utils = require("utils")
local tasker = require("tasker")

local M = { display = {}, space = {}, window = {} }

local function yabai(args, callback)
  return tasker.run("/opt/homebrew/bin/yabai", args, callback)
end

function M.reload(callback)
  tasker.run("launchctl", { "kickstart", "-k", "gui/${UID}/homebrew.mxcl.yabai" }, function(out, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      callback(out)
    end
  end)
end

function M.display.get(callback)
  yabai({ "-m", "query", "--displays" }, function(out, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      local displays = hs.json.decode(out)
      if utils.is_array(displays) then
        callback(displays)
      else
        log.i("not an array")
      end
    end
  end)
end

function M.display.get_current(callback)
  yabai({ "-m", "query", "--displays", "--display" }, function(out, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      local display = hs.json.decode(out)
      if display ~= nil then
        if callback ~= nil then
          callback(display)
        end
      else
        log.i("display is nil")
      end
    end
  end)
end

function M.space.get_current(callback)
  yabai({ "-m", "query", "--spaces", "--space" }, function(out, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      local space = hs.json.decode(out)
      if space ~= nil then
        if callback ~= nil then
          callback(space)
        end
      else
        log.i("space is nil")
      end
    end
  end)
end

function M.space.get(callback)
  yabai({ "-m", "query", "--spaces" }, function(out, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      local spaces = hs.json.decode(out)
      if utils.is_array(spaces) then
        if callback ~= nil then
          callback(spaces)
        end
      else
        log.i("not an array")
      end
    end
  end)
end

function M.space.get_by_display(display_index, callback)
  yabai({ "-m", "query", "--spaces", "--display", display_index }, function(out, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      local spaces = hs.json.decode(out)
      if utils.is_array(spaces) then
        if callback ~= nil then
          callback(spaces)
        end
      else
        log.i("not an array")
      end
    end
  end)
end

function M.space.get_last_space_index_of_display(display_index, callback)
  M.space.get_by_display(display_index, function(spaces)
    local last_space_index

    for _, space in pairs(spaces) do
      if last_space_index == nil then
        last_space_index = space.index
      else
        if space.index > last_space_index then
          last_space_index = space.index
        end
      end
    end

    if callback ~= nil then
      callback(last_space_index)
    end
  end)
end

function M.space.create(space_label, display_index, callback)
  local function verify_callback()
    if callback ~= nil then
      callback()
    end
  end

  M.space.get_last_space_index_of_display(display_index, function(last_space_index)
    if last_space_index ~= nil then
      log.i("creating " .. space_label .. " in display " .. display_index .. " with index " .. last_space_index)
      yabai(
        { "-m", "space", "--create", last_space_index, "--label", space_label, "--display", display_index },
        function(_, error)
          if not utils.is_empty(error) then
            log.i(error)
          end

          verify_callback()
        end
      )
    else
      log.i("could not find last space")

      verify_callback()
    end
  end)
end

function M.space.label(space_index, space_label, callback)
  yabai({ "-m", "space", space_index, "--label", space_label }, function(_, error)
    if callback ~= nil then
      callback(error)
    end
  end)
end

function M.space.move(space_index, display_index, callback)
  yabai({ "-m", "space", space_index, "--display", display_index }, function(_, error)
    if callback ~= nil then
      callback(error)
    end
  end)
end

function M.space.destroy(space_index, callback)
  yabai({ "-m", "space", space_index, "--destroy" }, function(_, error)
    if callback ~= nil then
      callback(error)
    end
  end)
end

function M.space.focus(label, callback)
  yabai({ "-m", "space", "--focus", label }, function(_, error)
    if callback ~= nil then
      callback(error)
    end
  end)
end

function M.space.rotate(rotate, callback)
  yabai({ "-m", "space", "--rotate", rotate }, function(_, error)
    if callback ~= nil then
      callback(error)
    end
  end)
end

function M.space.balance(callback)
  yabai({ "-m", "space", "--balance" }, function(_, error)
    if callback ~= nil then
      callback(error)
    end
  end)
end

function M.space.layout(layout, callback)
  yabai({ "-m", "space", "--layout", layout }, function(_, error)
    if callback ~= nil then
      callback(error)
    end
  end)
end

function M.window.get(callback)
  yabai({ "-m", "query", "--windows" }, function(out, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      local windows = hs.json.decode(out)
      if utils.is_array(windows) then
        if callback ~= nil then
          callback(windows)
        end
      else
        log.i("not an array")
      end
    end
  end)
end

function M.window.move(window_id, space_index, callback)
  yabai({ "-m", "window", window_id, "--space", space_index }, function(_, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      if callback ~= nil then
        callback()
      end
    end
  end)
end

function M.window.move_current(space_label, callback)
  yabai({ "-m", "window", "--space", space_label }, function(_, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      if callback ~= nil then
        callback()
      end
    end
  end)
end

function M.window.focus(direction, callback)
  yabai({ "-m", "window", "--focus", direction }, function(_, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      if callback ~= nil then
        callback()
      end
    end
  end)
end

function M.window.stack(direction, callback)
  yabai({ "-m", "window", "--stack", direction }, function(_, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      if callback ~= nil then
        callback()
      end
    end
  end)
end

function M.window.native_fullscreen(callback)
  yabai({ "-m", "window", "--toggle", "native-fullscreen" }, function(_, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      if callback ~= nil then
        callback()
      end
    end
  end)
end

function M.window.zoom_fullscreen(callback)
  yabai({ "-m", "window", "--toggle", "zoom-fullscreen" }, function(_, error)
    if not utils.is_empty(error) then
      log.i(error)
    else
      if callback ~= nil then
        callback()
      end
    end
  end)
end

return M
