return {
  "mvllow/modes.nvim",
  event = { "BufReadPost", "BufNewFile", "BufEnter" },
  config = function()
    local modes = require("modes")

    local present_catppuccin, catppuccin_palettes = pcall(require, "catppuccin.palettes")

    if not present_catppuccin then
      print("catppuccin not installed, cannot set modes")
      return
    end

    -- local palette = catppuccin_palettes.get_palette("mocha")

    vim.opt.cursorline = true

    modes.setup({
      -- colors = {
      --   copy = palette.yellow,
      --   delete = palette.red,
      --   insert = palette.green,
      --   visual = palette.purple,
      -- },
      colors = {
        copy = "#f5c359",
        delete = "#c75c6a",
        insert = "#78ccc5",
        visual = "#9745be",
      },
      -- Cursorline highlight opacity
      line_opacity = 0.30,
      -- Highlight cursor
      set_cursor = true,
    })
  end,
}
