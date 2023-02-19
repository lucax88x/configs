return {
    "rcarriga/nvim-notify",
    init = function()
      local r = require("lt.utils.remaps")

      r.noremap("n", "<leader>nc", function()
        local notify = require("notify")
        notify.dismiss()
      end, "Close all notifications")
    end,
    config = function()
      local notify = require("notify")

      notify.setup({
          stages = "fade",
          render = "minimal",
      })

      vim.notify = notify
    end,
}
