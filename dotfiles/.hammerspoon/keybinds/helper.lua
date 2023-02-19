-- todo:
-- move to display after creating space!
-- check is-native_fullscreen!

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

M.purge_cache = function()
  label_move_cache = {}
end

M.space = function(number, label)
  local function local_label_focus()
    yabai.space.focus(label, function(error)
      if not utils.is_empty(error) then
        if not string.find(error, "cannot focus an already focused space") then
          label_move_cache[label] = nil
          log.e(error)
          toast("could not move to " .. label)
        end
      else
        label_move_cache[label] = true

        yabai.space.get_current(function(get_current_error, current_space)
          if not utils.is_empty(get_current_error) then
            log.e(get_current_error)
            toast("could not get name of label, but moved!")
          else
            toast("moved to " .. current_space.label)
          end
        end)
      end
    end)
  end

  local function focus_space_or_create_if_missing()
    if label_move_cache[label] then
      log.i("space " .. label .. " in cache, focusing")
      local_label_focus()
    else
      yabai.space.get_all(function(error, spaces)
        if not utils.is_empty(error) then
          log.e(error)
          toast("could not get spaces")
        else
          local found_space = utils.any(spaces, function(space)
                return space.label == label
              end)

          if found_space then
            log.i("space " .. label .. " found, focusing")
            local_label_focus()
          else
            log.i("space " .. label .. " NOT found, creating")

            label_move_cache[label] = nil

            yabai.display.get_current(function(get_current_error, current_display)
              if not utils.is_empty(get_current_error) then
                log.e(get_current_error)
                toast("could not get current")
              else
                yabai.space.create(label, current_display.index, function(create_error, _)
                  if not utils.is_empty(create_error) then
                    log.e(create_error)
                    toast("could not create " .. label)
                  else
                    log.i("space " .. label .. " created, moving")
                    local_label_focus()
                  end
                end)
              end
            end)
          end
        end
      end)
    end
  end

  local function move_to_space()
    log.i("moving window to space " .. label)
    yabai.window.move_current(label, function(error)
      if not utils.is_empty(error) then
        log.e(error)
        toast("could not move to space " .. label)
      else
        toast("moved to " .. label)
        log.i("moved to " .. label)
      end
    end)
  end

  hs.hotkey.bind(M.modifiers.option, hs.keycodes.map[number], focus_space_or_create_if_missing)
  hs.hotkey.bind(M.modifiers.alt_shift, hs.keycodes.map[number], move_to_space)
end

return M
