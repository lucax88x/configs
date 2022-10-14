local utils = require("utils")

local M = { display = {}, space = {}, window = {} }

local function yabai(args, callback)
  local yabai_output = ""
  local yabai_error = ""

  local str_args = {}
  for key, value in pairs(args) do
    str_args[key] = tostring(value)
  end

  local task = hs.task.new("/opt/homebrew/bin/yabai", nil, function(_, stdout, stderr)
    --[[ print("stdout:"..stdout, "stderr:"..stderr) ]]
    if stdout ~= nil then
      yabai_output = yabai_output .. stdout
    end
    if stderr ~= nil then
      yabai_error = yabai_error .. stderr
    end
    return true
  end, str_args)

  if type(callback) == "function" then
    task:setCallback(function()
      callback(yabai_output, yabai_error)
    end)
  end

  task:start()
end

function M.display.get(callback)
  yabai({ "-m", "query", "--displays" }, function(out, error)
    if not utils.is_empty(error) then
      print(error)
    else
      local displays = hs.json.decode(out)
      if utils.is_array(displays) then
        callback(displays)
      else
        print("not an array")
      end
    end
  end)
end

function M.space.get(callback)
  yabai({ "-m", "query", "--spaces" }, function(out, error)
    if not utils.is_empty(error) then
      print(error)
    else
      local spaces = hs.json.decode(out)
      if utils.is_array(spaces) then
        if callback ~= nil then
          callback(spaces)
        end
      else
        print("not an array")
      end
    end
  end)
end

function M.space.get_by_display(display_index, callback)
  yabai({ "-m", "query", "--spaces", "--display", display_index }, function(out, error)
    if not utils.is_empty(error) then
      print(error)
    else
      local spaces = hs.json.decode(out)
      if utils.is_array(spaces) then
        if callback ~= nil then
          callback(spaces)
        end
      else
        print("not an array")
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
      print("creating " .. space_label .. " in display " .. display_index .. " with index " .. last_space_index)
      yabai(
        { "-m", "space", "--create", last_space_index, "--label", space_label, "--display", display_index },
        function(_, error)
          if not utils.is_empty(error) then
            print(error)
          end

          verify_callback()
        end
      )
    else
      print("could not find last space")

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

function M.window.get(callback)
  yabai({ "-m", "query", "--windows" }, function(out, error)
    if not utils.is_empty(error) then
      print(error)
    else
      local windows = hs.json.decode(out)
      if utils.is_array(windows) then
        if callback ~= nil then
          callback(windows)
        end
      else
        print("not an array")
      end
    end
  end)
end

function M.window.move(window_id, space_index, callback)
  yabai({ "-m", "window", window_id, "--space", space_index }, function(_, error)
    if not utils.is_empty(error) then
      print(error)
    else
      if callback ~= nil then
        callback()
      end
    end
  end)
end

return M
