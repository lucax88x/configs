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
			spaces.create_space_and_move_current_window()

			toast("moved to new space")
		end,
	},
	{
		text = "Purge empty spaces",
		action = function()
			spaces.purge_empty_spaces()
			toast("empty spaces purged")
		end,
	},
	{
		text = "Purge focused space",
		bind = { mods.option, "k" },
		action = function()
			local _, error = spaces.kill_current_space()
			if error == nil then
				toast("purged space")
			else
				toast("cannot purge space")
			end
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
for index, space in ipairs({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }) do
	hs.hotkey.bind(mods.option, space, function()
		spaces.move_to_space(index)
	end)
end

