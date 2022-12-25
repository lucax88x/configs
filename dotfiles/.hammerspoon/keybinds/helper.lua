local log = hs.logger.new("mine", "info")

local yabai = require("yabai.api")
local toast = require("toast")
local utils = require("utils")

local shift = "shift"
local option = "option"
local command = "command"
local control = "control"

local M = {
  modifiers = {
    ["shift"] = { shift },
    ["alt"] = { option },
    ["option"] = { option },
    ["command"] = { command },
    ["control"] = { control },
    ["super"] = { command, control },
    ["alt_shift"] = { option, shift },
  },
}

local label_move_cache = {}

M.space = function(number, label)
  local function local_label_focus()
    yabai.space.focus(label, function(error)
      if not utils.is_empty(error) then
        if not string.find(error, "cannot focus an already focused space") then
          label_move_cache[label] = nil
          toast("could not move to " .. label)
          log.i(error)
        end
      else
        label_move_cache[label] = true

        yabai.space.get_current(function(current_space)
          toast("moved to " .. current_space.label)
        end)
      end
    end)
  end

  local function focus_space_or_create_if_missing()
    if label_move_cache[label] then
      log.i("space " .. label .. " in cache, focusing")
      local_label_focus()
    else
      yabai.space.get(function(spaces)
        local found_space = utils.any(spaces, function(space)
          return space.label == label
        end)

        if found_space then
          log.i("space " .. label .. " found, focusing")
          local_label_focus()
        else
          log.i("space " .. label .. " NOT found, creating")

          label_move_cache[label] = nil

          yabai.display.get_current(function(current_display)
            yabai.space.create(label, current_display.index, function()
              toast("space " .. label .. " created on the fly")
              log.i("space " .. label .. " created, moving")
              local_label_focus()
            end)
          end)
        end
      end)
    end
  end

  local function move_to_space()
    yabai.window.move_current(label)
  end

  hs.hotkey.bind(M.modifiers.option, hs.keycodes.map[number], focus_space_or_create_if_missing)
  hs.hotkey.bind(M.modifiers.alt_shift, hs.keycodes.map[number], move_to_space)
end

return M
