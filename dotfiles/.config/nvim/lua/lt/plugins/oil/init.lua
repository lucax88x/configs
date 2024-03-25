return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    require("oil").setup({
      default_file_explorer = true,
      keymaps = {
        ["H"] = "actions.toggle_hidden",
      },
      view_options = {
        show_hidden = true,
      },
    })
  end,
  keys = {
    {
      "-",
      function()
        require("oil").open()
      end,
      desc = "open oil",
    },
    {
      "<leader>pw",
      function()
        local current_dir = require("oil").get_current_dir()
        vim.notify("changing pwd to " .. current_dir)
        vim.cmd.cd(current_dir)
      end,
      desc = "change pwd to current oil buffer (only when oil is open)",
    },
  },
}
