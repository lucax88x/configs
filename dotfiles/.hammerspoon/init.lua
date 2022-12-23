local toast = require("toast")

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall:updateRepo()
--[[ spoon.SpoonInstall:andUse("EmmyLua") ]]
--[[ spoon.SpoonInstall:andUse("ReloadConfiguration", { start = true }) ]]
spoon.SpoonInstall:andUse("RoundedCorners", { start = true, config = { radius = 0 } })

toast("reloading")

require("yabai")
require("keybinds")
require("rcmd")

toast("reloaded config")
