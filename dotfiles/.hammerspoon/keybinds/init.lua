local hs = hs
local yabai = require("yabai.api")
local yabai_helper = require("yabai.helper")
local helper = require("keybinds.helper")
local toast = require("toast")
local utils = require("utils")
local log = hs.logger.new("mine", "info")

local mods = helper.modifiers

local actions = {
    {
        text = "Reload Hammerspoon",
        action = function()
          hs.reload()
          helper.purge_cache()
        end,
    },
    {
        text = "Reload Yabai",
        action = function()
          yabai.reload()
          helper.purge_cache()
        end,
    },
    {
        text = "Purge cache",
        action = function()
          helper.purge_cache()
        end,
    },
    {
        text = "Balance space",
        description = "Balances space between windows",
        action = function()
          yabai.space.balance()
        end,
    },
    {
        text = "Purge empty spaces",
        action = function()
          yabai_helper.purge_empty_spaces(function(errors, results)
            log.e(utils.concatenate_table(errors))
            log.i(utils.concatenate_table(results))
          end)
        end,
    },
    {
        text = "Focus west",
        bind = { mods.alt, "h" },
        action = function()
          yabai.window.focus("west")
        end,
    },
    {
        text = "Focus east",
        bind = { mods.alt, "l" },
        action = function()
          yabai.window.focus("east")
        end,
    },
    {
        text = "Full screen",
        bind = { mods.alt, "f" },
        action = function()
          --[[ yabai.window.zoom_fullscreen() ]]
          yabai.window.native_fullscreen()
        end,
    },
    {
        text = "Rotate",
        bind = { mods.alt, "r" },
        action = function()
          yabai.space.rotate(90)
        end,
    },
    {
        text = "Stack",
        description = "Toggle bsp to stack",
        bind = { mods.alt, "s" },
        action = function()
          yabai.space.get_current(function(current_space)
            if current_space.type == "bsp" then
              yabai.space.layout("stack", function()
                toast("changed to stack")
              end)
            else
              if current_space.type == "stack" then
                yabai.space.layout("bsp", function()
                  toast("changed to bsp")
                end)
              else
                toast("cannot change, probably float")
              end
            end
          end)
        end,
    },
    {
        text = "Move to new space",
        bind = { mods.alt, "n" },
        action = function()
          yabai.window.move_current_to_new_space(function(error)
            if not utils.is_empty(error) then
              log.e(error)
              toast("cannot move to new space")
            end
          end)
        end,
    },
}

helper.space("1", "chat")
helper.space("2", "code")
helper.space("3", "terminal")
helper.space("4", "browser")
helper.space("5", "tools")
helper.space("6", "email")
helper.space("7", "extra")

local choices = {}
local mapped_actions = {}
for _, action in ipairs(actions) do
  if action.bind ~= nil then
    local modifiers = action.bind[1]
    local key = action.bind[2]

    hs.hotkey.bind(modifiers, hs.keycodes.map[key], nil, action.action)
  end

  table.insert(choices, { text = action.text, subText = action.description, action = action.text })
  mapped_actions[action.text] = action.action
end

local mainChooser = hs.chooser
    .new(function(option)
      if option ~= nil then
        local action = mapped_actions[option.text]
        if action ~= nil then
          action()
        end
      end
    end)
    :choices(choices)

hs.hotkey.bind(mods.super, hs.keycodes.map["return"], nil, function()
  mainChooser:show()
end)

--hs.hotkey.bind(super, hs.keycodes.map["»"], function()
--  yabai({ "-m", "space", "mouse", "--layout", "float" }, function()
--    toast("☁️")
--  end)
--end) --["3"]
--
----# rotate space
--hs.hotkey.bind(super, hs.keycodes.map["h"], function()
--  yabai({ "-m", "space", "--rotate", "270" }, function()
--    toast("🔲🔁")
--  end)
--end) --["."]
--
----# focus fullscreen
--hs.hotkey.bind(super, hs.keycodes.map["q"], function()
--  yabai({ "-m", "window", "--toggle", "zoom-fullscreen" })
--end) --["m"]
----hs.hotkey.bind(super, hs.keycodes.map["g"], function() yabai({"-m", "window", "--toggle", "zoom-parent"}) end) -- not so useful
--
----# toggle float layout for window
--hs.hotkey.bind(super, hs.keycodes.map["f"], function()
--  yabai({ "-m", "window", "--toggle", "float" })
--  toast("🎚☁️")
--end) --["/"]
--
--
----# change window focus to direction
--hs.hotkey.bind(super, hs.keycodes.map["n"], function()
--  yabai({ "-m", "window", "--focus", "east" })
--end) --[";"]
--hs.hotkey.bind(super, hs.keycodes.map["t"], function()
--  yabai({ "-m", "window", "--focus", "west" })
--end) --["j"]
--hs.hotkey.bind(super, hs.keycodes.map["r"], function()
--  yabai({ "-m", "window", "--focus", "north" })
--end) --["l"]
--hs.hotkey.bind(super, hs.keycodes.map["s"], function()
--  yabai({ "-m", "window", "--focus", "south" })
--end) --["k"]
--
----# bsp ratio
--hs.hotkey.bind(super, hs.keycodes.map["+"], function()
--  yabai({ "-m", "window", "--ratio", "abs:0.38" })
--  toast("🔲⅓")
--end) --["7"]
--hs.hotkey.bind(super, hs.keycodes.map["-"], function()
--  yabai({ "-m", "window", "--ratio", "abs:0.5" })
--  toast("🔲½")
--end) --["8"]
--hs.hotkey.bind(super, hs.keycodes.map["/"], function()
--  yabai({ "-m", "window", "--ratio", "abs:0.62" })
--  toast("🔲⅔")
--end) --["9"]
--hs.hotkey.bind(super, hs.keycodes.map["="], function()
--  yabai({ "-m", "space", "--balance" })
--  toast("🔲⚖️")
--end) --["-"]
--
