local toast = require("toast")
--
hs.loadSpoon("SpoonInstall")
--
spoon.SpoonInstall:updateRepo()
--[[ spoon.SpoonInstall:andUse("EmmyLua") ]]
--[[ spoon.SpoonInstall:andUse("ReloadConfiguration", { start = true }) ]]
--[[ spoon.SpoonInstall:andUse("RoundedCorners", { start = true, config = { radius = 0 } }) ]]
require("yabai")
require("keybinds")
require("rcmd")

hs.ipc.cliInstall("/opt/homebrew")
--[[ local stackline = require("stackline") ]]
--[[]]
--[[ stackline:init({ ]]
--[[   paths = { ]]
--[[     yabai = "/opt/homebrew/bin/yabai", ]]
--[[   }, ]]
--[[ }) ]]
--[[]]
--[[ stackline.config:set("appearance.showIcons", false) ]]
toast("reloaded config")
