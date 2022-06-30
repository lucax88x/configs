local present, scrollbar = pcall(require, "scrollbar")

if not present then
	return
end

local palette = require("gruvbox.palette")

scrollbar.setup({
	handle = {
		color = palette.dark1,
	},
	marks = {
		search = { color = palette.neutral_yellow },
		error = { color = palette.neutral_red },
		Warn = { color = palette.neutral_yellow },
		Info = { color = palette.neutral_aqua },
		Hint = { color = palette.neutral_aqujak },
		Misc = { color = palette.neutral_blue },
	},
})
