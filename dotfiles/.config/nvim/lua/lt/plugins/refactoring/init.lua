return {
  "ThePrimeagen/refactoring.nvim",
  init = function()
    local r = require("lt.utils.remaps")

    r.which_key("<leader>te", "extract")
    r.which_key("<leader>ti", "inline")

    local opts = { silent = true, expr = false }

    r.noremap("n", "<leader>teb", function()
      require("refactoring").refactor("Extract Block")
    end, "Extract Block", opts)

    r.noremap("n", "<leader>teB", function()
      require("refactoring").refactor("Extract Block To File")
    end, "Extract Block", opts)

    r.noremap("v", "<leader>tef", function()
      require("refactoring").refactor("Extract Function")
    end, "Extract Function", opts)

    r.noremap("v", "<leader>teF", function()
      require("refactoring").refactor("Extract Function To File")
    end, "Extact Function to file", opts)

    r.noremap("v", "<leader>tev", function()
      require("refactoring").refactor("Extract Variable")
    end, "Extact variable", opts)

    r.noremap("v", "<leader>tiv", function()
      require("refactoring").refactor("Inline Variable")
    end, "Inline variable", opts)

    r.noremap("v", "<leader>tl", function()
      require("telescope").extensions.refactoring.refactors()
    end, "Refactor list", opts)
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
