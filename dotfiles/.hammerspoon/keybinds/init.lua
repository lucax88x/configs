local yabai = require("yabai.api")
local helper = require("keybinds.helper")

local mods = helper.modifiers

local actions = {
  ["reload"] = function()
    hs.reload()
  end,
  ["balance_space"] = function()
    yabai({ "-m", "space", "--balance" })
  end,
}

--# Main chooser
local mainChooser = hs.chooser
    .new(function(option)
      if option ~= nil then
        actions[option.action]()
      end
    end)
    :choices({
      {
        text = "Reload",
        subText = "Reload Hammerspoon configuration",
        action = "reload",
      },
      {
        text = "Balance space",
        subText = "Balances space between windows",
        action = "balance_space",
      },
    })

local binds = {
  {
    mods.super,
    "return",
    function()
      mainChooser:show()
    end,
  },
  {
    mods.alt,
    "h",
    function()
      yabai.window.focus("west")
    end,
  },
  {
    mods.alt,
    "l",
    function()
      yabai.window.focus("east")
    end,
  },
}

helper.label_move("1", "chat")
helper.label_move("2", "code")
helper.label_move("3", "terminal")
helper.label_move("4", "browser")
helper.label_move("5", "tools")
helper.label_move("6", "email")

for _, bind in ipairs(binds) do
  local modifiers = bind[1]
  local key = bind[2]
  local fn = bind[3]

  print(modifiers, key, fn)

  hs.hotkey.bind(modifiers, hs.keycodes.map[key], nil, fn)
end

--[[ hs.hotkey.bind(mods.alt, hs.keycodes.map["l"], function() ]]
--[[   yabai({ "-m", "window", "--focus", "east" }) ]]
--[[ end) ]]

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
