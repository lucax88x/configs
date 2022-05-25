local present, modes = pcall(require, "modes")

if not present then
	return
end

local gruvbox = require("gruvbox.colors")

vim.opt.cursorline = true

modes.setup({
  colors = {
    copy = gruvbox.bright_yellow,
    delete = gruvbox.bright_red,
    insert = gruvbox.bright_green,
    visual = gruvbox.bright_purple,
  },

  -- Cursorline highlight opacity
  line_opacity = 0.2,

  -- Highlight cursor
  set_cursor = true,
})
