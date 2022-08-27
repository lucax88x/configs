local vim = vim

vim.cmd("syntax on")

vim.o.termguicolors = true

local present, gruvbox = pcall(require, "gruvbox")

if not present then
  vim.notify("could not load gruvbox")
  return
end

vim.o.background = "dark"

gruvbox.setup({
  contrast = "hard",
})

vim.cmd("colorscheme gruvbox")

local palette = require("gruvbox.palette")

local highlight = require("lt.utils.functions").highlight
local highlight_fg_bg = require("lt.utils.functions").highlight_fg_bg
local highlight_fg = require("lt.utils.functions").highlight_fg
local highlight_bg = require("lt.utils.functions").highlight_bg
local from_highlight = require("lt.utils.functions").from_highlight
local get_color_from_terminal = require("lt.utils.functions").get_color_from_terminal

local bg = palette.dark0_hard
local bg_alt = palette.dark0

-- vim.cmd([[:hi ColorColumn ctermbg=0 guibg=lightgrey]])
highlight_bg("SignColumn", palette.bg)
highlight_bg("NumberColumn", palette.bg)

-- autocomplete, like CMP
highlight_fg_bg("PMenu", palette.light1, bg_alt)

-- fold preview, for example
highlight_fg_bg("NormalFloat", palette.light1, bg_alt)
-- no border
highlight_fg_bg("FloatBorder", bg_alt, bg_alt)

highlight_fg("StatusLine", palette.bg)

if pcall(require, "telescope") then
  --[[ link_highlight("TelescopeBorder", "GruvboxBg2", true) ]]
  -- functions.link_highlight("TelescopePromptBorder", "GruvboxBg2", true)
  -- functions.link_highlight("TelescopeResultsBorder", "GruvboxBg2", true)
  -- functions.link_highlight("TelescopePreviewBorder", "GruvboxBg2", true)

  highlight_fg_bg("TelescopeBorder", palette.light1, bg_alt)
  highlight_fg_bg("TelescopePromptBorder", bg_alt, bg_alt)
  highlight_fg_bg("TelescopeResultsBorder", bg_alt, bg_alt)
  highlight_fg_bg("TelescopePreviewBorder", bg_alt, bg_alt)

  highlight_fg_bg("TelescopePromptNormal", palette.light1, bg_alt)
  highlight_fg_bg("TelescopePromptPrefix", palette.light1, bg_alt)

  highlight_fg_bg("TelescopeResultsTitle", palette.light1, bg_alt)
  highlight_bg("TelescopeNormal", bg_alt)
  highlight_bg("TelescopeSelection", palette.bg)
  -- highlight_bg("TelescopeSelection", colors.dark2)
end

if pcall(require, "nvim-tree") then
  highlight_fg("NvimTreeEmptyFolderName", palette.light1)
  highlight_fg("NvimTreeEndOfBuffer", bg_alt)
  highlight_fg("NvimTreeFolderIcon", palette.light1)
  highlight_fg("NvimTreeFolderName", palette.light1)
  -- highlight_fg("NvimTreeGitDirty", red)
  -- highlight_fg("NvimTreeIndentMarker", one_bg2)
  highlight_bg("NvimTreeNormal", bg_alt)
  highlight_bg("NvimTreeNormalNC", bg_alt)
  highlight_fg("NvimTreeOpenedFolderName", palette.light1)
  highlight_fg("NvimTreeRootFolder", palette.light1)
  highlight_fg_bg("NvimTreeStatuslineNc", bg_alt, bg_alt)
  highlight_fg_bg("NvimTreeVertSplit", bg_alt, bg_alt)
  -- highlight_fg_bg("NvimTreeWindowPicker", red, black2)
end

if pcall(require, "hop") then
  vim.api.nvim_command("highlight HopNextKey  guifg=" .. palette.light0 .. " gui=bold ctermfg=198 cterm=bold")
  vim.api.nvim_command("highlight HopNextKey1 guifg=" .. palette.light1 .. " gui=bold ctermfg=45 cterm=bold")
  vim.api.nvim_command("highlight HopNextKey2 guifg=" .. palette.light2 .. " ctermfg=33")
  vim.api.nvim_command("highlight HopUnmatched guifg=#666666 guibg=bg guisp=#666666 ctermfg=242")
end

if pcall(require, "cmp") then
  vim.cmd("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=" .. palette.neutral_red)
  -- highlight_fg("CmpItemAbbrDeprecated", colors.neutral_red)
  highlight_fg("CmpItemAbbrMatch", palette.neutral_blue)
  highlight_fg("CmpItemAbbrMatchFuzzy", palette.neutral_blue)
  highlight_fg("CmpItemKindVariable", palette.neutral_aqua)
  highlight_fg("CmpItemKindInterface", palette.neutral_aqua)
  highlight_fg("CmpItemKindText", palette.neutral_aqua)
  highlight_fg("CmpItemKindFunction", palette.neutral_purple)
  highlight_fg("CmpItemKindMethod", palette.neutral_purple)
  highlight_fg("CmpItemKindKeyword", palette.neutral_green)
  highlight_fg("CmpItemKindProperty", palette.neutral_green)
  highlight_fg("CmpItemKindUnit", palette.neutral_green)
end

if pcall(require, "indent_blankline") then
  vim.cmd("highlight IndentBlanklineContextChar guifg=" .. palette.light2 .. " gui=nocombine")
  vim.cmd("highlight IndentBlanklineContextStart guisp=" .. palette.light2 .. " gui=underline cterm=underline")
end

if pcall(require, "feline") then
  local feline_theme = {
    bg = bg_alt,
    alt = bg,
    fg = palette.light1,
    hint = from_highlight("DiagnosticHint").bg or palette.neutral_aqua,
    info = from_highlight("DiagnosticInfo").bg or palette.neutral_blue,
    warn = from_highlight("DiagnosticWarn").bg or palette.neutral_orange,
    err = from_highlight("DiagnosticError").bg or palette.neutral_red,
    black = get_color_from_terminal(0, palette.dark0_hard),
    red = get_color_from_terminal(1, palette.neutral_red),
    green = get_color_from_terminal(2, palette.neutral_green),
    yellow = get_color_from_terminal(3, palette.neutral_yellow),
    blue = get_color_from_terminal(4, palette.neutral_blue),
    magenta = get_color_from_terminal(5, palette.neutral_purple),
    cyan = get_color_from_terminal(6, palette.neutral_aqua),
    white = palette.light1,
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
    FlnStatus = { fg = c.fg, bg = c.bg, bold = true },

    -- Dianostic Separators
    FlnStatusBg = { fg = c.bg, bg = c.alt },
    FlnStatusToDiagnostic = { fg = c.bg, bg = c.alt },
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
