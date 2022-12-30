return {
  "j-hui/fidget.nvim",
  config = function()
    local fidget = require("fidget")

    fidget.setup({
      text = {
        spinner = "dots",
      },
    })
  end,
}
