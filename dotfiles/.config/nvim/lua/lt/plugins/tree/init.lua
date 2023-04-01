return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  init = function()
    local r = require("lt.utils.remaps")

    r.noremap("n", "-", "<cmd>Neotree reveal<CR>", "Toggle explorer")
  end,
  config = {
    enable_git_status = false,
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = true,
    },
    window = {
      -- position = "current",
      mappings = {
        ["-"] = "close_window",
        ["/"] = "noop"
      }
    }
  }
}
