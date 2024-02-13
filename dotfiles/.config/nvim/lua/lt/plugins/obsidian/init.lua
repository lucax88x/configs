return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    completion = {
      nvim_cmp = true,
    },
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },
  },
  keys = {
    { "<leader>no", "<cmd>ObsidianOpen<cr>", desc = "Open Obsidian" },
    { "<leader>nn", "<cmd>ObsidianNew<cr>", desc = "New note" },
    { "<leader>ns", "<cmd>ObsidianSearch", desc = "Search notes" },
    { "<leader>nq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick switch in obsidian workspace" },
    { "<leader>nw", "<cmd>ObsidianWorkspace work<cr>", desc = "Change to workspace work in obsidian" },
    { "<leader>np", "<cmd>ObsidianWorkspace personal<cr>", desc = "Change to workspace home in obsidian" },
  },
}
