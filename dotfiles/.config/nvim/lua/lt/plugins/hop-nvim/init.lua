local present, hop = pcall(require, "hop")

if not present then
  return
end

hop.setup({
  jump_on_sole_occurrence = true,
  uppercase_labels = true,
})

local colors = require("gruvbox.colors")

vim.api.nvim_command("highlight HopNextKey  guifg=" .. colors.light0 .. " gui=bold ctermfg=198 cterm=bold")
vim.api.nvim_command("highlight HopNextKey1 guifg=" .. colors.light1 .. " gui=bold ctermfg=45 cterm=bold")
vim.api.nvim_command("highlight HopNextKey2 guifg=" .. colors.light2 .. " ctermfg=33")
vim.api.nvim_command("highlight HopUnmatched guifg=#666666 guibg=bg guisp=#666666 ctermfg=242")

local hint = require("hop.hint")
local r = require("lt.utils.remaps")

r.map("n", "s", function()
  hop.hint_char1({ direction = hint.HintDirection.AFTER_CURSOR, current_line_only = false })
end, "Search")

r.map("n", "S", function()
  hop.hint_char1({ direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = false })
end, "Search")

r.map("n", "f", function()
  hop.hint_char1({ direction = hint.HintDirection.AFTER_CURSOR, current_line_only = true })
end, "Search")

r.map("n", "f", function()
  hop.hint_char1({ direction = hint.HintDirection.AFTER_CURSOR, current_line_only = true })
end, "Search")

r.map("n", "F", function()
  hop.hint_char1({ direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = true })
end, "Search")

r.map("o", "f", function()
  hop.hint_char1({
    direction = hint.HintDirection.AFTER_CURSOR,
    current_line_only = true,
    inclusive_jump = true,
  })
end, "Search")

r.map("o", "F", function()
  hop.int_char1({
    direction = hint.HintDirection.BEFORE_CURSOR,
    current_line_only = true,
    inclusive_jump = true,
  })
end, "Search")

r.map("", "t", function()
  hop.hint_char1({ direction = hint.HintDirection.AFTER_CURSOR, current_line_only = true })
end, "Search")

r.map("", "T", function()
  hop.hint_char1({ direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = true })
end, "Search")
