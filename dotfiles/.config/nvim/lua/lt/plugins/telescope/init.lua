return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>/c",  function() require("telescope.builtin").commands() end,                         desc = "Search commands" },
    { "<leader>pp",  "<cmd>Telescope projects<CR>",                                                  desc = "Projects" },
    { "<leader>sl",  function() require("telescope.builtin").live_grep() end,                        desc = "Live grep" },
    { "<leader>sL",  function() require("lt.plugins.telescope.functions").live_grep_in_folder() end, desc = "Live grep in folder" },
    { "<leader>sc",  function() require("lt.plugins.telescope.functions").search_config() end,       desc = "Search neovim config" },
    { "<leader>pf",  function() require("telescope.builtin").find_files() end,                       desc = "Find files" },
    { "<leader>po",  function() require("telescope.builtin").oldfiles() end,                         desc = "Find files" },
    { "<leader>pg",  function() require("telescope.builtin").git_files() end,                        desc = "Find git files" },
    { "<leader>/h",  function() require("telescope.builtin").highlights() end,                       desc = "Search highlights" },
    { "<leader>/C",  function() require("telescope.builtin").command_history() end,                  desc = "Search command history" },
    { "<leader>/r",  function() require("telescope.builtin").registers() end,                        desc = "Search registers" },
    { "<leader>/m",  function() require("telescope.builtin").marks() end,                            desc = "Search marks" },
    { "<leader>/k",  function() require("telescope.builtin").keymaps() end,                          desc = "Search keymaps" },
    { "<leader>/t",  function() require("telescope.builtin").treesitter() end,                       desc = "Search treesitter" },
    { "<leader>/gb", function() require("telescope.builtin").git_branches() end,                     desc = "Search git branches" },
    { "<leader>/gc", function() require("telescope.builtin").git_commits() end,                      desc = "Search git commits" },
    { "<leader>bl",  function() require("telescope.builtin").buffers() end,                          desc = "Search buffers" },
    { "<leader>bc",  function() require("telescope.builtin").git_bcommits() end,                     desc = "Search buffer git commits" },
    { "<leader>//",  function() require("telescope.builtin").resume() end,                           desc = "Resume" },
  },
  config = function()
    local telescope = require("telescope")

    local functions = require("lt.utils.functions")

    telescope.setup({
      defaults = {
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        -- layout_config = { prompt_position = "bottom" },
      },
      pickers = {
        buffers = {
          sort_lastused = true,
          sort_mru = true,
          previewer = false,
          theme = "dropdown",
          ignore_current_buffer = true,
        },
        find_files = { theme = "dropdown", previewer = false },
        git_files = { theme = "dropdown", previewer = false },
        registers = { theme = "dropdown" },
        lsp_code_actions = {
          theme = "cursor",
          layout_config = {
            height = 12,
          },
        },
        lsp_range_code_actions = { theme = "cursor" },
        loclist = { previewer = false },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({
            -- even more opts
          }),
        },
      },
    })

    telescope.load_extension("ui-select")

    if functions.is_macunix() then
      telescope.load_extension("fzf")
    else
      vim.notify("not using fzf")
    end

    if pcall(require, "project_nvim") then
      telescope.load_extension("projects")
    end

    if pcall(require, "harpoon") then
      telescope.load_extension("harpoon")
    end

    if pcall(require, "dap") then
      telescope.load_extension("dap")
    end

    if pcall(require, "refactoring") then
      telescope.load_extension("refactoring")
    end
  end,
}
