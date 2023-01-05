return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  init = function()
    local r = require("lt.utils.remaps")

    r.which_key("<leader>gd", "diffview")

    r.noremap("n", "<leader>gdo", "<cmd>DiffviewOpen<CR>", "Open diffview")
    r.noremap("n", "<leader>gdc", "<cmd>DiffviewClose<CR>", "Close diffview")
    r.noremap("n", "<leader>gdr", "<cmd>DiffviewRefresh<CR>", "Refresh diffview")
    r.noremap("n", "<leader>gdt", "<cmd>DiffviewToggleFiles<CR>", "Toggle files in diffview")
  end,
  config = function()
    local diffview = require("diffview")
    diffview.setup({})
  end,
  cmd = "DiffviewOpen",
}
