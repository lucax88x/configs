return {
  "mvllow/modes.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local modes = require("modes")

    local present_catppuccin, catppuccin_palettes = pcall(require, "catppuccin.palettes")

    if not present_catppuccin then
      print("catppuccin not installed, cannot set modes")
      return
    end

    local palette = catppuccin_palettes.get_palette("mocha")

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
  end,
}
