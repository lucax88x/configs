local helper = require("keybinds.helper")
local toast = require("toast")
local spaces = require("spaces")
local windows = require("windows")
local yabai = require("yabai")

local mods = helper.modifiers

local actions = {
	{
		text = "Reload Hammerspoon",
		action = function()
			hs.reload()
		end,
	},
	{
		text = "Full screen",
		bind = { mods.option, "f" },
		action = function()
			windows.full_screen()
		end,
	},
	{
		text = "Minimize",
		bind = { mods.option, "M" },
		action = function()
			windows.minimize()
		end,
	},
	{
		text = "Maximize",
		bind = { mods.option, "m" },
		action = function()
			windows.maximize()
		end,
	},
	{
		text = "Move to new space",
		bind = { mods.option, "n" },
		action = function()
			spaces.create_space_and_move_current_window(function(_, error)
				if error == nil then
					toast("moved to new space")
				else
					toast("cannot move to new space")
				end
			end)
		end,
	},
	{
		text = "Purge empty spaces",
		action = function()
			spaces.purge_empty_spaces(function(_, error)
				if error == nil then
					toast("purged space")
				else
					toast("cannot purge space")
				end
			end)
		end,
	},
	{
		text = "Purge focused space",
		bind = { mods.option, "k" },
		action = function()
			spaces.purge_current_space(function(_, error)
				if error == nil then
					toast("purged space")
				else
					toast("cannot purge space")
				end
			end)
		end,
	},
	{
		text = "Move window to right space",
		bind = { mods.option, "l" },
		action = function()
			windows.move_window_one_space("right", true)
		end,
	},
	{
		text = "Move window to left space",
		bind = { mods.option, "h" },
		action = function()
			windows.move_window_one_space("left", true)
		end,
	},
}

helper.init(actions)

hs.hotkey.bind(mods.option, "up", function()
	windows.window_size(0, 0, 1, 0.5)
end)
hs.hotkey.bind(mods.option, "down", function()
	windows.window_size(0, 0.5, 1, 0.5)
end)
hs.hotkey.bind(mods.option, "left", function()
	windows.window_size(0, 0, 0.5, 1)
end)
hs.hotkey.bind(mods.option, "right", function()
	windows.window_size(0.5, 0, 0.5, 1)
end)
hs.hotkey.bind(mods.option, "t", function()
	yabai.window.toggle_float()
end)
hs.hotkey.bind(mods.option, "q", function()
	windows.close()
end)
for index, space in ipairs({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }) do
	hs.hotkey.bind(mods.option, space, function()
		spaces.move_to_space(index)
	end)
end
