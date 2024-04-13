return {
  "gennaro-tedesco/nvim-possession",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  config = true,
  keys = {
    {
      "<leader>Sl",
      function()
        local possession = require("nvim-possession")
        possession.list()
      end,
      desc = "List sessions",
    },
    {
      "<leader>Sn",
      function()
        local possession = require("nvim-possession")
        possession.new()
      end,
      desc = "Create session",
    },
    {
      "<leader>Su",
      function()
        local possession = require("nvim-possession")
        possession.update()
      end,
      desc = "Update session",
    },
    {
      "<leader>Sd",
      function()
        local possession = require("nvim-possession")
        possession.delete()
      end,
      desc = "Delete session",
    },
  },
}
