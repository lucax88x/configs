-- Lazy.nvim
return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    require("codecompanion").setup({
      strategies = {
        chat = "ollama",
        inline = "ollama",
      },

      adapters = {
        ollama = require("codecompanion.adapters").use("ollama", {
          schema = {
            model = {
              default = "deepseek-coder:6.7b",
            },
          },
        }),
      },
    })
  end,
  config = function()
    -- Expand `cc` into CodeCompanion in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
  keys = {
    {
      "<leader>ic",
      "<cmd>CodeCompanionToggle<CR>",
      desc = "A[I] [C]hat",
      mode = { "n", "v" },
    },
    {
      "<leader>ia",
      "<cmd>CodeCompanion<CR>",
      desc = "A[I] [A]sk",
      mode = { "n", "v" },
    },
    {
      "<leader>il",
      "<cmd>CodeCompanionActions<CR>",
      desc = "A[I] [L]ist of actions",
      mode = { "n", "v" },
    },
  },
}
