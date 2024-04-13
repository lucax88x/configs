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
    new_notes_location = "notes_subdir",
    workspaces = {
      {
        name = "work",
        path = "~/vaults/work",
      },
      {
        name = "personal",
        path = "~/vaults/personal",
      },
    },
  },
  cmd = "ObsidianSearch",
  keys = {
    { "<leader>no", "<cmd>ObsidianOpen<cr>", desc = "Open Obsidian" },
    { "<leader>nn", "<cmd>ObsidianNew<cr>", desc = "New note" },
    { "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "Search notes" },
    { "<leader>nt", "<cmd>ObsidianTags<cr>", desc = "List notes by tags" },
    { "<leader>nq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick switch in obsidian workspace" },
    { "<leader>nw", "<cmd>ObsidianWorkspace work<cr>", desc = "Change to workspace work in obsidian" },
    { "<leader>np", "<cmd>ObsidianWorkspace personal<cr>", desc = "Change to workspace home in obsidian" },
  },
}
