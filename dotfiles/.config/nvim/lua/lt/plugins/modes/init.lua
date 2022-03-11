local present, modes = pcall(require, "modes")

if not present then
	return
end

local gruvbox = require("gruvbox.colors")

vim.opt.cursorline = true

modes.setup({
  colors = {
    copy = gruvbox.neutral_yellow,
    delete = gruvbox.neutral_red,
    insert = gruvbox.neutral_green,
    visual = gruvbox.neutral_purple,
  },

  -- Cursorline highlight opacity
  line_opacity = 0.2,

  -- Highlight cursor
  set_cursor = true,

  -- Highlight in active window only
  focus_only = true
})
