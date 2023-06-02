return {
  "lewis6991/gitsigns.nvim",
  init = function()
    local r = require("lt.utils.remaps")

    r.which_key("<leader>gh", "hunks")

    r.noremap("n", "]h", function()
      if vim.wo.diff then
        return "]h"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end, "go to next hunk", { expr = true })

    r.noremap("n", "[h", function()
      if vim.wo.diff then
        return "[h"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end, "go to prev hunk", { expr = true })

    r.noremap("n", "<leader>ghs", function()
      require("gitsigns").stage_hunk()
    end, "Stage hunk")
    r.noremap("n", "<leader>ghu", function()
      require("gitsigns").undo_stage_hunk()
    end, "Undo stage hunk")
    r.noremap("n", "<leader>ghr", function()
      require("gitsigns").reset_hunk()
    end, "Reset hunk")
    r.noremap("n", "<leader>ghp", function()
      require("gitsigns").preview_hunk()
    end, "Preview hunk")
    r.noremap("n", "<leader>ghb", function()
      require("gitsigns").blame_line()
    end, "Blame line")
    r.noremap("n", "<leader>ghd", function()
      require("gitsigns").diffthis()
    end, "Diff this")
  end,
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      numhl = false,
      watch_gitdir = {
        interval = 1000,
      },
      sign_priority = 9,
      status_formatter = nil, -- Use default
    })

    local present_scrollbar = pcall(require, "scrollbar")

    if present_scrollbar then
      require("scrollbar.handlers.gitsigns").setup()
    end
  end,
  event = { "BufReadPre", "BufNewFile", "BufEnter" },
}
