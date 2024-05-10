return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { options = vim.opt.sessionoptions:get() },
  keys = {
    {
      "<leader>Ss",
      function()
        require("persistence").load()
      end,
      desc = "Restore Session",
    },
    {
      "<leader>Sl",
      function()
        require("persistence").load({ last = true })
      end,
      desc = "Restore Last Session",
    },
    {
      "<leader>Sd",
      function()
        require("persistence").stop()
      end,
      desc = "Don't Save Current Session",
    },
  },
}
