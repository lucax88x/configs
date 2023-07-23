require("luarocks.loader")
local toast = require("toast")
--
hs.loadSpoon("SpoonInstall")
hs.window.animationDuration = 0.2
--
spoon.SpoonInstall:updateRepo()
spoon.SpoonInstall:andUse("ReloadConfiguration", { start = true })
--[[ spoon.SpoonInstall:andUse("EmmyLua") ]]
--[[ spoon.SpoonInstall:andUse("RoundedCorners", { start = true, config = { radius = 0 } }) ]]
-- require("yabai")
require("keybinds")
require("rcmd")

hs.ipc.cliInstall("/opt/homebrew")
toast("reloaded config")
