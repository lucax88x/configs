local present, modes = pcall(require, "modes")

if not present then
	return
end

local palette = require("gruvbox.palette")

vim.opt.cursorline = true

modes.setup({
  colors = {
    copy = palette.bright_yellow,
    delete = palette.bright_red,
    insert = palette.bright_green,
    visual = palette.neutral_purple,
  },

  -- Cursorline highlight opacity
  line_opacity = 0.2,

  -- Highlight cursor
  set_cursor = true,
})
