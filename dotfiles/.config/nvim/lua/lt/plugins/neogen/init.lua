return {
  "danymat/neogen",
  init = function()
    local r = require("lt.utils.remaps")

    r.map("n", "<leader>tc", function()
      require("neogen").generate()
    end, "Add documentation for the method/class/function ")
  end,
  config = function()
    local neogen = require("neogen")

    neogen.setup({
      enabled = true,
      snippet_engine = "luasnip",
    })
  end,
  dependencies = "nvim-treesitter/nvim-treesitter",
  keys = "<leader>tc",
}
