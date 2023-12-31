return {
  "ThePrimeagen/refactoring.nvim",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    local r = require("lt.utils.remaps")

    r.which_key("<leader>re", "extract")
    r.which_key("<leader>ri", "inline")

    local opts = { silent = true, expr = false }

    r.noremap({ "n", "v" }, "<leader>reb", function()
      require("refactoring").refactor("Extract Block")
    end, "Extract Block", opts)

    r.noremap({ "n", "v" }, "<leader>reB", function()
      require("refactoring").refactor("Extract Block To File")
    end, "Extract Block", opts)

    r.noremap({ "n", "v" }, "<leader>rem", function()
      require("refactoring").refactor("Extract Function")
    end, "Extract Function", opts)

    r.noremap({ "n", "v" }, "<leader>reM", function()
      require("refactoring").refactor("Extract Function To File")
    end, "Extact Function to file", opts)

    r.noremap({ "n", "v" }, "<leader>rev", function()
      require("refactoring").refactor("Extract Variable ")
    end, "Extact variable", opts)

    r.noremap({ "n", "v" }, "<leader>riv", function()
      require("refactoring").refactor("Inline Variable")
    end, "Inline variable", opts)

    r.noremap({ "n", "v" }, "<leader>rl", function()
      require("refactoring").select_refactor()
    end, "Refactor", opts)
  end,
  config = function()
    local refactoring = require("refactoring")

    refactoring.setup({})
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
}
