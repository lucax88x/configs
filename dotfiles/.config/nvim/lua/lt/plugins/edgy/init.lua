return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    bottom = {
      -- {
      --   ft = "toggleterm",
      --   size = { height = 0.4 },
      --   -- exclude floating windows
      --   filter = function(buf, win)
      --     return vim.api.nvim_win_get_config(win).relative == ""
      --   end,
      -- },
      { ft = "qf", title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        -- only show help buffers
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
      { ft = "neotest-output-panel", title = "Neotest OutputPanel", size = { height = 0.3 } },
      {
        ft = "toggleterm",
        title = "Term",
        size = { height = 0.4 },
        filter = function(buf)
          return not vim.b[buf].lazyterm_cmd
        end,
      },
    },
    left = {
      { ft = "neotest-summary", title = "Neotest Summary", size = { width = 0.4 } },
    },
    right = {
      { ft = "codecompanion", title = "Code Companion Chat", size = { width = 0.4 } },
      { ft = "aerial", title = "Symbols", size = { width = 0.2 } },
    },
  },
}
