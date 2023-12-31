return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    require("oil").setup({
      default_file_explorer = true,
      keymaps = {
        ["H"] = "actions.toggle_hidden",
      },
      view_options = {
        show_hidden = false,
      },
    })
  end,
  keys = {
    {
      "-",
      function()
        require("oil").open()
      end,
      desc = "Open file explorer",
    },
  },
}
