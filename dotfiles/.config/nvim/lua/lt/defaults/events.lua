local events = require("lt.utils.events")

events.addEventListener("LuaHighlight", { "TextYankPost *" }, function()
	vim.highlight.on_yank({ timeout = 500 })
end)
