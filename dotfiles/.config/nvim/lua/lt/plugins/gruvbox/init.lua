vim.cmd("syntax on")

vim.cmd("colorscheme gruvbox")

vim.o.termguicolors = true
vim.o.background = "dark"

vim.g.gruvbox_contrast_dark = "dark"
vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_invert_tabline = true

local colors = require("gruvbox.colors")

local highlight_fg_bg = require("lt.utils.functions").highlight_fg_bg
local highlight_fg = require("lt.utils.functions").highlight_fg
local highlight_bg = require("lt.utils.functions").highlight_bg

-- vim.cmd([[:hi ColorColumn ctermbg=0 guibg=lightgrey]])
highlight_bg("SignColumn", colors.dark0)
highlight_bg("NumberColumn", colors.dark0_hard)
highlight_fg_bg("PMenu", colors.light1, colors.dark0_hard)
highlight_fg_bg("NormalFloat", colors.light1, colors.dark0)
highlight_fg("StatusLine", colors.dark0)

if pcall(require, "telescope") then
	-- functions.link_highlight("TelescopeBorder", "GruvboxBg2", true)
	-- functions.link_highlight("TelescopePromptBorder", "GruvboxBg2", true)
	-- functions.link_highlight("TelescopeResultsBorder", "GruvboxBg2", true)
	-- functions.link_highlight("TelescopePreviewBorder", "GruvboxBg2", true)

	highlight_fg_bg("TelescopeBorder", colors.light1, colors.dark0_hard)
	highlight_fg_bg("TelescopePromptBorder", colors.dark0_hard, colors.dark0_hard)
	highlight_fg_bg("TelescopeResultsBorder", colors.dark0_hard, colors.dark0_hard)
	highlight_fg_bg("TelescopePreviewBorder", colors.dark0_hard, colors.dark0_hard)

	highlight_fg_bg("TelescopePromptNormal", colors.light1, colors.dark0_hard)
	highlight_fg_bg("TelescopePromptPrefix", colors.light1, colors.dark0_hard)

	highlight_fg_bg("TelescopeResultsTitle", colors.light1, colors.dark0_hard)
	highlight_bg("TelescopeNormal", colors.dark0_hard)
	highlight_bg("TelescopeSelection", colors.dark0)
	-- highlight_bg("TelescopeSelection", colors.dark2)
end

if pcall(require, "nvim-tree") then
	highlight_fg("NvimTreeEmptyFolderName", colors.light1)
	highlight_fg("NvimTreeEndOfBuffer", colors.dark0_hard)
	highlight_fg("NvimTreeFolderIcon", colors.light1)
	highlight_fg("NvimTreeFolderName", colors.light1)
	-- highlight_fg("NvimTreeGitDirty", red)
	-- highlight_fg("NvimTreeIndentMarker", one_bg2)
	highlight_bg("NvimTreeNormal", colors.dark0_hard)
	highlight_bg("NvimTreeNormalNC", colors.dark0_hard)
	highlight_fg("NvimTreeOpenedFolderName", colors.light1)
	highlight_fg("NvimTreeRootFolder", colors.light1)
	highlight_fg_bg("NvimTreeStatuslineNc", colors.dark0_hard, colors.dark0_hard)
	highlight_fg_bg("NvimTreeVertSplit", colors.dark0_hard, colors.dark0_hard)
	-- highlight_fg_bg("NvimTreeWindowPicker", red, black2)
end

if pcall(require, "cmp") then
  vim.cmd("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=" .. colors.neutral_red)
	-- highlight_fg("CmpItemAbbrDeprecated", colors.neutral_red)
	highlight_fg("CmpItemAbbrMatch", colors.neutral_blue)
	highlight_fg("CmpItemAbbrMatchFuzzy", colors.neutral_blue)
	highlight_fg("CmpItemKindVariable", colors.neutral_aqua)
	highlight_fg("CmpItemKindInterface", colors.neutral_aqua)
	highlight_fg("CmpItemKindText", colors.neutral_aqua)
	highlight_fg("CmpItemKindFunction", colors.neutral_purple)
	highlight_fg("CmpItemKindMethod", colors.neutral_purple)
	highlight_fg("CmpItemKindKeyword", colors.neutral_green)
	highlight_fg("CmpItemKindProperty", colors.neutral_green)
	highlight_fg("CmpItemKindUnit", colors.neutral_green)
end
