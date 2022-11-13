local vim = vim

vim.cmd("syntax on")

vim.o.termguicolors = true

local present, catppuccin = pcall(require, "catppuccin")

if not present then
  vim.notify("could not load catppuccin")
  return
end

vim.cmd.colorscheme("catppuccin-mocha")

catppuccin.setup({
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    feline = true,
    fidget = true,
    hop = true,
    mason = true,
    dap = true,
    which_key = true,
  },
})

local palette = require("catppuccin.palettes").get_palette("mocha")

local highlight = require("lt.utils.functions").highlight
local highlight_bg = require("lt.utils.functions").highlight_bg
local get_color_from_terminal = require("lt.utils.functions").get_color_from_terminal

if pcall(require, "ufo") then
  highlight_bg("UfoFoldedBg", palette.base)
end

local bg = palette.mantle
local bg_alt = palette.base
local red = palette.red
local green = palette.green
local blue = palette.blue
local aqua = palette.sapphire
local yellow = palette.yellow
local orange = palette.orange
local purple = palette.mauve

if pcall(require, "feline") then
  local feline_theme = {
    bg = bg_alt,
    alt = bg,
    fg = palette.light1,
    hint = aqua,
    info = blue,
    warn = orange,
    err = red,
    black = get_color_from_terminal(0, bg_alt),
    red = get_color_from_terminal(1, red),
    green = get_color_from_terminal(2, green),
    yellow = get_color_from_terminal(3, yellow),
    blue = get_color_from_terminal(4, blue),
    magenta = get_color_from_terminal(5, purple),
    cyan = get_color_from_terminal(6, aqua),
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
