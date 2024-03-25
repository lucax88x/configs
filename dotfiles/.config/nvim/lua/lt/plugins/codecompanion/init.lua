-- Lazy.nvim
return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
  },
  init = function()
    require("codecompanion").setup({
      adapters = {
        chat = "ollama",
        inline = "ollama",
      },
    })
  end,
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat<CR>", desc = "Chat with code companion" },
    { "<leader>cC", "<cmd>CodeCompanionToggle<CR>", desc = "Toggle chat with code companion" },
    { "<leader>cr", "<cmd>CodeCompanion<CR>", desc = "Code companion", mode = { "n", "v" } },
    { "<leader>ca", "<cmd>CodeCompanionActions<CR>", desc = "Code companion actions", mode = { "n", "v" } },
    -- vim.api.nvim_set_keymap("n", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })

    -- vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("n", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("v", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
  },
}
