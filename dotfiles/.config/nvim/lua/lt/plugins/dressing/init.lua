return {
  "stevearc/dressing.nvim",
  config = function()
    local dressing = require("dressing")
    dressing.setup({})
  end,
  event = "VeryLazy"
}
