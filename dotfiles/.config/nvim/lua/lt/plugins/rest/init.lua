return {
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = { "luarocks.nvim" },
  config = function()
    require("rest-nvim").setup({
      env_file = "http-client.env.json",
    })
  end,
  keys = {
    {
      "<leader>cr",
      "<cmd>Rest run<cr>",
      desc = "Run http request under the cursor",
    },
    {
      "<leader>cl",
      "<cmd>Rest run last<cr>",
      desc = "Re-run latest httplocalleader request",
    },
  },
}
