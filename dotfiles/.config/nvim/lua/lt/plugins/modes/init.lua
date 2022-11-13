local present, modes = pcall(require, "modes")

if not present then
	return
end

local palette = require("catppuccin.palettes").get_palette("mocha")

vim.opt.cursorline = true

modes.setup({
  colors = {
    copy = palette.yellow,
    delete = palette.red,
    insert = palette.green,
    visual = palette.purple,
  },

  -- Cursorline highlight opacity
  line_opacity = 0.2,

  -- Highlight cursor
  set_cursor = true,
})
