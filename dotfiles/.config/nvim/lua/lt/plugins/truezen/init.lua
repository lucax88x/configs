return {
  "Pocco81/true-zen.nvim",
  keys = { "<leader>Z" },
  init = function()
    local r = require("lt.utils.remaps")

    r.noremap("n", "<leader>zz", function()
      local truezen = require("true-zen")
      truezen.ataraxis()
    end, "zen")
  end,
  config = function()
    local truezen = require("true-zen")
    truezen.setup({
      integrations = {},
      modes = {
        ataraxis = {
          quit_untoggles = true,
          minimum_writing_area = { -- minimum size of main window
            width = 80,
          },
          padding = { -- padding windows
            left = 5,
            right = 5,
            top = 0,
            bottom = 0,
          },
        },
      },
    })
  end,
}
