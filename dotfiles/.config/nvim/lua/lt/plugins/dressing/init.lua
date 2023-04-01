return {
  "stevearc/dressing.nvim",
  config = function()
    local dressing = require("dressing")
    dressing.setup({
      select = {
        -- fzf-lua will do this
        enabled = false,
      }
    })
  end,
  event = "VeryLazy"
}
