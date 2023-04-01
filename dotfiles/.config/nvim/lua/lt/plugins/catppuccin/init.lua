return {
  "catppuccin/nvim",
  config = function()
    vim.cmd("syntax on")

    vim.o.termguicolors = true

    local catppuccin = require("catppuccin")

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
        neotree = true,
        noice = true,
        telescope = true,
        treesitter = true,
        hop = true,
        mason = true,
        dap = true,
        which_key = true,
        notify = true,
        aerial = true,
      },
    })

    local palette = require("catppuccin.palettes").get_palette("mocha")

    local highlight_bg = require("lt.utils.functions").highlight_bg

    if pcall(require, "ufo") then
      highlight_bg("UfoFoldedBg", palette.base)
    end
  end,
}
