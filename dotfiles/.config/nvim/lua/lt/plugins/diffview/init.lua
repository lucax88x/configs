return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local diffview = require("diffview")

    diffview.setup({})
  end,
  keys = {
    { "<leader>gT",  "<cmd>DiffviewFileHistory<CR>", desc = "Navigate history (diffview)",        mode = { "n", "v" } },
    { "<leader>gdo", "<cmd>DiffviewOpen<CR>",        desc = "Open diffview" },
    { "<leader>gdc", "<cmd>DiffviewClose<CR>",       desc = "Close diffview" },
    { "<leader>gdr", "<cmd>DiffviewRefresh<CR>",     desc = "Refresh diffview" },
    { "<leader>gdt", "<cmd>DiffviewToggleFiles<CR>", desc = "Toggle files in diffview" },
  },
  cmd = "DiffviewOpen"
}
