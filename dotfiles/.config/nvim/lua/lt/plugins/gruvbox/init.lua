vim.cmd("syntax on")

vim.o.termguicolors = true
vim.o.background = "dark"

vim.g.gruvbox_contrast_dark = "hard"

vim.cmd("colorscheme gruvbox")

local colors = require("gruvbox.colors")

local highlight = require("lt.utils.functions").highlight
local highlight_fg_bg = require("lt.utils.functions").highlight_fg_bg
local highlight_fg = require("lt.utils.functions").highlight_fg
local highlight_bg = require("lt.utils.functions").highlight_bg
local from_highlight = require("lt.utils.functions").from_highlight
local get_color_from_terminal = require("lt.utils.functions").get_color_from_terminal

local bg = colors.dark0_hard
local bg_alt = colors.dark0

-- vim.cmd([[:hi ColorColumn ctermbg=0 guibg=lightgrey]])
highlight_bg("SignColumn", colors.bg)
highlight_bg("NumberColumn", colors.bg)

-- autocomplete, like CMP
highlight_fg_bg("PMenu", colors.light1, bg_alt)

-- fold preview, for example
highlight_fg_bg("NormalFloat", colors.light1, bg_alt)
-- no border
highlight_fg_bg("FloatBorder", bg, bg)

highlight_fg("StatusLine", colors.bg)

if pcall(require, "telescope") then
	-- functions.link_highlight("TelescopeBorder", "GruvboxBg2", true)
	-- functions.link_highlight("TelescopePromptBorder", "GruvboxBg2", true)
	-- functions.link_highlight("TelescopeResultsBorder", "GruvboxBg2", true)
	-- functions.link_highlight("TelescopePreviewBorder", "GruvboxBg2", true)

	highlight_fg_bg("TelescopeBorder", colors.light1, bg_alt)
	highlight_fg_bg("TelescopePromptBorder", bg_alt, bg_alt)
	highlight_fg_bg("TelescopeResultsBorder", bg_alt, bg_alt)
	highlight_fg_bg("TelescopePreviewBorder", bg_alt, bg_alt)

	highlight_fg_bg("TelescopePromptNormal", colors.light1, bg_alt)
	highlight_fg_bg("TelescopePromptPrefix", colors.light1, bg_alt)

	highlight_fg_bg("TelescopeResultsTitle", colors.light1, bg_alt)
	highlight_bg("TelescopeNormal", bg_alt)
	highlight_bg("TelescopeSelection", colors.bg)
	-- highlight_bg("TelescopeSelection", colors.dark2)
end

if pcall(require, "nvim-tree") then
	highlight_fg("NvimTreeEmptyFolderName", colors.light1)
	highlight_fg("NvimTreeEndOfBuffer", bg_alt)
	highlight_fg("NvimTreeFolderIcon", colors.light1)
	highlight_fg("NvimTreeFolderName", colors.light1)
	-- highlight_fg("NvimTreeGitDirty", red)
	-- highlight_fg("NvimTreeIndentMarker", one_bg2)
	highlight_bg("NvimTreeNormal", bg_alt)
	highlight_bg("NvimTreeNormalNC", bg_alt)
	highlight_fg("NvimTreeOpenedFolderName", colors.light1)
	highlight_fg("NvimTreeRootFolder", colors.light1)
	highlight_fg_bg("NvimTreeStatuslineNc", bg_alt, bg_alt)
	highlight_fg_bg("NvimTreeVertSplit", bg_alt, bg_alt)
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

if pcall(require, "indent_blankline") then
	vim.cmd("highlight IndentBlanklineContextChar guifg=" .. colors.light2 .. " gui=nocombine")
	vim.cmd("highlight IndentBlanklineContextStart guisp=" .. colors.light2 .. " gui=underline cterm=underline")
end

if pcall(require, "feline") then
	local feline_theme = {
		bg = bg_alt,
		alt = bg,
		fg = colors.light1,
		hint = from_highlight("DiagnosticHint").bg or colors.neutral_aqua,
		info = from_highlight("DiagnosticInfo").bg or colors.neutral_blue,
		warn = from_highlight("DiagnosticWarn").bg or colors.neutral_orange,
		err = from_highlight("DiagnosticError").bg or colors.neutral_red,
		black = get_color_from_terminal(0, colors.dark0_hard),
		red = get_color_from_terminal(1, colors.neutral_red),
		green = get_color_from_terminal(2, colors.neutral_green),
		yellow = get_color_from_terminal(3, colors.neutral_yellow),
		blue = get_color_from_terminal(4, colors.neutral_blue),
		magenta = get_color_from_terminal(5, colors.neutral_purple),
		cyan = get_color_from_terminal(6, colors.neutral_aqua),
		white = colors.light1,
	}

	local c = feline_theme

	local groups = {
		FlnViBlack = { fg = c.white, bg = c.black, bold = true },
		FlnViRed = { fg = c.bg, bg = c.red, bold = true },
		FlnViGreen = { fg = c.bg, bg = c.green, bold = true },
		FlnViYellow = { fg = c.bg, bg = c.yellow, bold = true },
		FlnViBlue = { fg = c.bg, bg = c.blue, bold = true },
		FlnViMagenta = { fg = c.bg, bg = c.magenta, bold = true },
		FlnViCyan = { fg = c.bg, bg = c.cyan, bold = true },
		FlnViWhite = { fg = c.bg, bg = c.white, bold = true },

		FlnBlack = { fg = c.black, bg = c.white, bold = true },
		FlnRed = { fg = c.red, bg = c.bg, bold = true },
		FlnGreen = { fg = c.green, bg = c.bg, bold = true },
		FlnYellow = { fg = c.yellow, bg = c.bg, bold = true },
		FlnBlue = { fg = c.blue, bg = c.bg, bold = true },
		FlnMagenta = { fg = c.magenta, bg = c.bg, bold = true },
		FlnCyan = { fg = c.cyan, bg = c.bg, bold = true },
		FlnWhite = { fg = c.white, bg = c.bg, bold = true },

		-- Diagnostics
		FlnHint = { fg = c.int, bg = c.alt, bold = true },
		FlnInfo = { fg = c.info, bg = c.alt, bold = true },
		FlnWarn = { fg = c.warn, bg = c.alt, bold = true },
		FlnError = { fg = c.err, bg = c.alt, bold = true },
		FlnStatus = { fg = c.black, bg = c.white, bold = true },

		-- Dianostic Separators
		FlnStatusBg = { fg = c.white, bg = c.alt },
		FlnStatusToDiagnostic = { fg = c.white, bg = c.alt },
		FlnFileTypeToDiagnostic = { fg = c.bg, bg = c.alt },

		FlnAlt = { fg = c.white, bg = c.alt },
		FlnFileInfo = { fg = c.white, bg = c.alt },
		FlnFileType = { fg = c.white, bg = c.bg },
		FlnFileEnc = { fg = c.white, bg = c.bg },
		FlnAltSep = { fg = c.bg, bg = c.alt },
		FlnFileInfoSep = { fg = c.bg, bg = c.alt },
		FlnGitBranch = { fg = c.fg, bg = c.bg },
		FlnGitAdded = { fg = c.green, bg = c.bg },
		FlnGitChanged = { fg = c.yellow, bg = c.bg },
		FlnGitRemoved = { fg = c.red, bg = c.bg },
		FlnGitSeparator = { fg = c.bg, bg = c.alt },
	}

	for k, v in pairs(groups) do
		highlight(k, v)
	end
end
