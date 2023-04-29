return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "haydenmeade/neotest-jest",
    "marilari88/neotest-vitest",
    "Issafalcon/neotest-dotnet",
  },
  keys = { "<leader>;" },
  init = function()
    local r = require("lt.utils.remaps")

    r.which_key("<leader>;", "+test")

    r.noremap("n", "<leader>;f", function()
      require("neotest").run.run()
    end, "Run the nearest test")

    r.noremap("n", "<leader>;r", function()
      require("neotest").run.run(vim.fn.expand("%"))
    end, "Run tests the current file")

    r.noremap("n", "<leader>;d", function()
      require("neotest").run.run({ strategy = "dap" })
    end, "Debug the nearest test (requires nvim-dap and adapter support)")

    r.noremap("n", "<leader>;s", function()
      require("neotest").run.stop()
    end, "Stop the nearest test")

    --[[ require("neotest").run.attach() ]]
  end,
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "jest --watch ",
        }),
        require('neotest-vitest'),
        require('neotest-dotnet')
      },
    })
  end,
}
