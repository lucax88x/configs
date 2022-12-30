return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    notify.setup({
      stages = "fade",
      render = "minimal",
    })

    vim.notify = notify
  end,
}
