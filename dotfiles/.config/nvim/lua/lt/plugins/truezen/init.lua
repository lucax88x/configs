local present, truezen = pcall(require, "true-zen")

if not present then
  return
end

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

local r = require("lt.utils.remaps")

r.noremap("n", "<leader>Z", truezen.ataraxis, "zen")
