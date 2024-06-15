return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({})
  end,
  keys = {
    {
      "<leader>ss",
      function()
        require("grug-far").grug_far()
      end,
      desc = "Search all",
    },
    {
      "<leader>sw",
      function()
        require("grug-far").grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "Search this word",
    },
  },
}
