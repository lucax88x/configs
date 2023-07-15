return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      numhl = false,
      watch_gitdir = {
        interval = 500,
      },
      sign_priority = 9,
      status_formatter = nil, -- Use default
    })

    local present_scrollbar = pcall(require, "scrollbar")

    if present_scrollbar then
      require("scrollbar.handlers.gitsigns").setup()
    end
  end,
  keys = {
    { "]h", function()
      if vim.wo.diff then
        return "]h"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end, "go to next hunk", { expr = true },
    },

    { "[h", function()
      if vim.wo.diff then
        return "[h"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end, "go to prev hunk", { expr = true } },

    {
      "<leader>hs",
      function()
        require("gitsigns").stage_hunk()
      end,
      desc = "Stage hunk"
    },
    {
      "<leader>hu",
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      desc = "Undo stage hunk"
    },
    {
      "<leader>hr",
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "Reset hunk"
    },
    {
      "<leader>hp",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Preview hunk"
    },
    {
      "<leader>hb",
      function()
        require("gitsigns").blame_line { full = true }
      end,
      desc = "Blame line"
    },
    {
      "<leader>hd",
      function()
        require("gitsigns").diffthis()
      end,
      desc = "Diff this"
    },
  }
}
