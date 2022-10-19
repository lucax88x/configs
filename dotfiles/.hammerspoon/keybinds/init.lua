local yabai = require("yabai.api")
local toast = require("toast")
local utils = require("utils")

local super = { "command", "control" }
local alt = { "option" }

--# Main chooser
local mainChooser = hs.chooser
    .new(function(option)
      if option ~= nil then
        if option.action == "reload" then
          hs.reload()
        elseif option.action == "toggle_gap" then
          toast("todo")
          --[[ yabai({ "-m", "space", "--toggle", "padding" }, function() ]]
          --[[   yabai({ "-m", "space", "--toggle", "gap" }) ]]
          --[[ end) ]]
        end
      end
    end)
    :choices({
      {
        text = "Reload",
        subText = "Reload Hammerspoon configuration",
        action = "reload",
      },
      {
        text = "Toggle Gap",
        subText = "Toggles padding and gaps around the current space",
        action = "toggle_gap",
      },
    })

local label_move_cache = {}
local function label_move(number, label)
  local function label_focus()
    label_move_cache[label] = true
    yabai.space.focus(label, function(error)
      if not utils.is_empty(error) then
        if not string.find(error, "cannot focus an already focused space") then
          label_move_cache[label] = nil
          toast("could not move to " .. label)
          print(error)
        end
      end
    end)
  end

  hs.hotkey.bind(alt, hs.keycodes.map[number], function()
    if label_move_cache[label] then
      label_focus()
    else
      yabai.space.get(function(spaces)
        if utils.any(spaces, function(space)
          return space.label == label
        end) then
          label_focus()
        else
          label_move_cache[label] = nil
          toast("space " .. label .. " not created")
        end
      end)
    end
  end)
end

--# open main chooser
hs.hotkey.bind(super, hs.keycodes.map["return"], nil, function()
  mainChooser:show()
end)

label_move("1", "chat")
label_move("2", "code")
label_move("3", "terminal")
label_move("4", "browser")
label_move("5", "tools")
label_move("6", "email")

--hs.hotkey.bind(super, hs.keycodes.map["«"], function()
--  yabai({ "-m", "space", "mouse", "--layout", "stack" }, function()
--    toast("📚")
--  end)
--end) --["2"]
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
----# change window stack focus
--hs.hotkey.bind(super, hs.keycodes.map["è"], function()
--  yabai({ "-m", "window", "--focus", "stack.next" }, function()
--    toast("📚↥")
--  end)
--end) --["t"]
--hs.hotkey.bind(super, hs.keycodes.map[","], function()
--  yabai({ "-m", "window", "--focus", "stack.prev" }, function()
--    toast("📚↧")
--  end)
--end) --["g"]
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
