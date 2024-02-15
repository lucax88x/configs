return {
  "danymat/neogen",
  config = function()
    local neogen = require("neogen")

    neogen.setup({
      enabled = true,
      snippet_engine = "luasnip",
    })
  end,
  dependencies = "nvim-treesitter/nvim-treesitter",
  keys = {
    {
      "<leader>tc",
      function()
        require("neogen").generate()
      end,
      desc = "Add documentation for the method/class/function "
    },
  }
}
