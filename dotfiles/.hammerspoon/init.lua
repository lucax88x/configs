hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall:updateRepo()
--[[ spoon.SpoonInstall:andUse("EmmyLua") ]]
--[[ spoon.SpoonInstall:andUse("ReloadConfiguration", { start = true }) ]]
spoon.SpoonInstall:andUse("RoundedCorners", { start = true, config = { radius = 0 } })

require("yabai")
require("keybinds")
local toast = require("toast")

toast("reloaded config")
