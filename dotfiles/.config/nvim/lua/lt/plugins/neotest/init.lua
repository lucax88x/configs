return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "haydenmeade/neotest-jest",
    "marilari88/neotest-vitest",
    "Issafalcon/neotest-dotnet",
    "nvim-neotest/neotest-plenary",
  },
  keys = {
    {
      "<leader>;f",
      function()
        require("neotest").run.run()
      end,
      desc = "Run the nearest test"
    },
    {
      "<leader>;t",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run latest test"
    },
    {
      "<leader>;l",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run tests the current file"
    },
    {
      "<leader>;d",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug the nearest test (requires nvim-dap and adapter support)"
    },
    {
      "<leader>;s",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop the nearest test"
    },
    {
      "<leader>;;",
      function()
        require("neotest").summary()
      end,
      desc = "Summary of tests"
    },
    {
      "<leader>;w",
      function()
        require("neotest").watch()
      end,
      desc = "Watch tests"
    },
    {
      "<leader>;o",
      function()
        require("neotest").output_panel()
      end,
      desc = "Output panel"
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "jest --watch ",
        }),
        require('neotest-vitest'),
        require('neotest-dotnet'),
        require("neotest-plenary"),
      },
    })
  end,
}
