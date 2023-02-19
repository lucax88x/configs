local log = hs.logger.new("yabai.api", "info")
local utils = require("utils")
local tasker = require("tasker")

local M = { display = {}, space = {}, window = {} }

local function yabai(args, callback)
  return tasker.run("/opt/homebrew/bin/yabai", args, callback)
end

local function ensure(callback, error, result)
  if callback ~= nil then
    callback(error, result)
  end
end

function M.reload(callback)
  tasker.run("launchctl", { "kickstart", "-k", "gui/${UID}/homebrew.mxcl.yabai" }, function(out, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, out)
    end
  end)
end

function M.display.get_all(callback)
  yabai({ "-m", "query", "--displays" }, function(out, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      local displays = hs.json.decode(out)
      if utils.is_array(displays) then
        ensure(callback, nil, displays)
      else
        ensure(callback, "not an array", nil)
      end
    end
  end)
end

function M.display.get_current(callback)
  yabai({ "-m", "query", "--displays", "--display" }, function(out, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      local display = hs.json.decode(out)
      if display ~= nil then
        ensure(callback, nil, display)
      else
        ensure(callback, "display is nil", nil)
      end
    end
  end)
end

function M.display.get_by_index(index, callback)
  yabai({ "-m", "query", "--displays", "--display", index }, function(out, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      local display = hs.json.decode(out)
      if display ~= nil then
        ensure(callback, nil, display)
      else
        ensure(callback, "display is nil", nil)
      end
    end
  end)
end

function M.space.get_current(callback)
  yabai({ "-m", "query", "--spaces", "--space" }, function(out, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      local space = hs.json.decode(out)
      if space ~= nil then
        ensure(callback, nil, space)
      else
        ensure(callback, "space is nil", nil)
      end
    end
  end)
end

function M.space.get(index, callback)
  yabai({ "-m", "query", "--spaces", "--space", index }, function(out, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      local space = hs.json.decode(out)
      if space ~= nil then
        ensure(callback, nil, space)
      else
        ensure(callback, "space is nil", nil)
      end
    end
  end)
end

function M.space.get_all(callback)
  yabai({ "-m", "query", "--spaces" }, function(out, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      local spaces = hs.json.decode(out)
      if utils.is_array(spaces) then
        ensure(callback, nil, spaces)
      else
        ensure(callback, "not an array", nil)
      end
    end
  end)
end

function M.space.get_by_display(display_index, callback)
  yabai({ "-m", "query", "--spaces", "--display", display_index }, function(out, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      local spaces = hs.json.decode(out)
      if utils.is_array(spaces) then
        if callback ~= nil then
          ensure(callback, nil, spaces)
        end
      else
        ensure(callback, "not an array", nil)
      end
    end
  end)
end

function M.space.get_last_space_index_of_display(display_index, callback)
  M.display.get_by_index(display_index, function(error, display)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      local last_space_index

      for _, space_index in pairs(display.spaces) do
        if last_space_index == nil then
          last_space_index = space_index
        else
          if space_index > last_space_index then
            last_space_index = space_index
          end
        end
      end

      ensure(callback, nil, last_space_index)
    end
  end)
end

function M.space.create(space_label, display_index, callback)
  local must_label = space_label ~= nil

  if must_label then
    log.i("creating " .. space_label .. " in display " .. display_index)
  else
    log.i("creating display " .. display_index)
  end

  yabai({ "-m", "space", "--create" }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
      return
    end

    M.space.get_last_space_index_of_display(display_index, function(get_last_space_index_error, last_space_index)
      if not utils.is_empty(get_last_space_index_error) then
        ensure(callback, get_last_space_index_error, nil)
      else
        if last_space_index ~= nil then
          M.space.get(last_space_index, function(get_space_error, space)
            if not utils.is_empty(get_space_error) then
              ensure(callback, get_space_error, nil)
            else
              local callbacks_count = 0

              local must_move = space.display ~= display_index

              if must_move then
                callbacks_count = callbacks_count + 1
                log.i("move to display " .. display_index)
              end
              if must_label then
                callbacks_count = callbacks_count + 1
                log.i("label to " .. space_label)
              end

              local verify_callbacks = utils.aggregate_callbacks(
                callbacks_count,
                function(aggregate_error, _)
                  ensure(callback, aggregate_error, space)
                end
              )

              if must_move then
                M.space.move(last_space_index, display_index, function(move_error)
                  if not utils.is_empty(move_error) then
                    verify_callbacks(move_error, nil)
                  else
                    verify_callbacks(nil, space)
                  end
                end)
              end

              if must_label then
                M.space.label(last_space_index, space_label, function(label_error)
                  if not utils.is_empty(label_error) then
                    verify_callbacks(label_error, nil)
                  else
                    verify_callbacks(nil, space)
                  end
                end)
              end
            end
          end)
        else
          ensure(callback, "could not find last space", nil)
        end
      end
    end)
  end)
end

function M.space.label(space_index, space_label, callback)
  yabai({ "-m", "space", space_index, "--label", space_label }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.space.move(space_index, display_index, callback)
  yabai({ "-m", "space", space_index, "--display", display_index }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.space.destroy(space_index, callback)
  yabai({ "-m", "space", space_index, "--destroy" }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.space.focus(label, callback)
  yabai({ "-m", "space", "--focus", label }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.space.rotate(rotate, callback)
  yabai({ "-m", "space", "--rotate", rotate }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.space.balance(callback)
  yabai({ "-m", "space", "--balance" }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.space.layout(layout, callback)
  yabai({ "-m", "space", "--layout", layout }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.window.get_all(callback)
  yabai({ "-m", "query", "--windows" }, function(out, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      local windows = hs.json.decode(out)
      if utils.is_array(windows) then
        ensure(callback, nil, windows)
      else
        ensure(callback, "not an array", nil)
      end
    end
  end)
end

function M.window.get_current(callback)
  yabai({ "-m", "query", "--windows", "--window" }, function(out, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      local window = hs.json.decode(out)
      if window ~= nil then
        ensure(callback, nil, window)
      else
        ensure(callback, "not a window", nil)
      end
    end
  end)
end

function M.window.get(id, callback)
  yabai({ "-m", "query", "--windows", "--window", id }, function(out, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      local window = hs.json.decode(out)
      if window ~= nil then
        ensure(callback, nil, window)
      else
        ensure(callback, "not a window", nil)
      end
    end
  end)
end

function M.window.move(window_id, space_index, callback)
  yabai({ "-m", "window", window_id, "--space", space_index }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.window.move_current(space_label, callback)
  yabai({ "-m", "window", "--space", space_label }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.window.focus(direction, callback)
  yabai({ "-m", "window", "--focus", direction }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.window.stack(direction, callback)
  yabai({ "-m", "window", "--stack", direction }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.window.native_fullscreen(callback)
  yabai({ "-m", "window", "--toggle", "native-fullscreen" }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.window.zoom_fullscreen(callback)
  yabai({ "-m", "window", "--toggle", "zoom-fullscreen" }, function(_, error)
    if not utils.is_empty(error) then
      ensure(callback, error, nil)
    else
      ensure(callback, nil, nil)
    end
  end)
end

function M.window.move_current_to_new_space(callback)
  M.window.get_current(function(current_window_error, window)
    if not utils.is_empty(current_window_error) then
      ensure(callback, current_window_error, nil)
    else
      local is_native_fullscreen = window["is-native-fullscreen"]

      if is_native_fullscreen then
        ensure(callback, "window is full screen, cannot move!", nil)
      else
        M.space.create(nil, window.display, function(create_error, space)
          log.i("space created, move the window")

          if not utils.is_empty(create_error) then
            ensure(callback, create_error, nil)
          else
            M.window.move(window.id, space.index, function(move_error)
              if not utils.is_empty(move_error) then
                ensure(callback, move_error, nil)
              else
                ensure(callback, nil, nil)
              end
            end)
          end
        end)
      end
    end
  end)
end

return M
