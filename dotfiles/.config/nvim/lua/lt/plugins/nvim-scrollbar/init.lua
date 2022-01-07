local present, scrollbar = pcall(require, "scrollbar")

if not present then
	return
end

local colors = require("gruvbox.colors")

scrollbar.setup({
	handle = {
		color = colors.dark1,
	},
	marks = {
		search = { color = colors.neutral_yellow },
		error = { color = colors.neutral_red },
		Warn = { color = colors.neutral_yellow },
		Info = { color = colors.neutral_aqua },
		Hint = { color = colors.neutral_aqujak },
		Misc = { color = colors.neutral_blue },
	},
})
