return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "haydenmeade/neotest-jest",
    "marilari88/neotest-vitest",
    "MisanthropicBit/neotest-busted",
    "Issafalcon/neotest-dotnet",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-go",
  },
  keys = {
    {
      "<leader>;r",
      function()
        require("neotest").run.run()
      end,
      desc = "Run the nearest test",
    },
    {
      "<leader>;t",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run latest test",
    },
    {
      "<leader>;l",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run tests the current file",
    },
    {
      "<leader>;d",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug the nearest test (requires nvim-dap and adapter support)",
    },
    {
      "<leader>;s",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop the nearest test",
    },
    {
      "<leader>;;",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle summary of tests",
    },
    {
      "<leader>;:",
      function()
        require("neotest").summary.open()
      end,
      desc = "Open Summary of tests",
    },
    {
      "<leader>;w",
      function()
        require("neotest").watch()
      end,
      desc = "Watch tests",
    },
    {
      "<leader>;o",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Neotest toggle Output panel",
    },
    {
      "<leader>;O",
      function()
        require("neotest").output.open()
      end,
      desc = "Neotest open Output",
    },
    -- vim.api.nvim_set_keymap(
    --     "n",
    --     "<leader>twr",
    --     "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>",
    --     {desc = "Run Watch"}
    -- )
    --
    -- vim.api.nvim_set_keymap(
    --     "n",
    --     "<leader>twf",
    --     "<cmd>lua require('neotest').run.run({ vim.fn.expand("%"), vitestCommand = 'vitest --watch' })<cr>",
    --     {desc = "Run Watch File"}
    -- )
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "jest --watch ",
        }),
        require("neotest-vitest"),
        require("neotest-dotnet"),
        require("neotest-plenary"),
        require("neotest-go"),
        require("neotest-busted"),
      },
    })
  end,
}
