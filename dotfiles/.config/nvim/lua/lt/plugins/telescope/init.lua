return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "aaronhallaert/advanced-git-search.nvim" },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>/c", function() require("telescope.builtin").commands() end,        desc = "Search commands" },
    { "<leader>/C", function() require("telescope.builtin").command_history() end, desc = "Search command history" },
    { "<leader>sl", function() require("telescope.builtin").live_grep() end,       desc = "Live grep" },
    {
      "<leader>sc",
      function()
        require("telescope.builtin").find_files({
          prompt = "< Config >",
          cwd = "$HOME/.config/nvim",
        })
      end,
      desc = "Search neovim config"
    },
    { "<leader>pf", function() require("telescope.builtin").find_files() end, desc = "Find files" },
    { "<leader>po", function() require("telescope.builtin").oldfiles() end,   desc = "Find files" },
    { "<leader>pg", function() require("telescope.builtin").git_files() end,  desc = "Find git files" },
    { "<leader>/h",  function() require("telescope.builtin").highlights() end,   desc = "Search highlights" },
    { "<leader>/r",  function() require("telescope.builtin").registers() end,    desc = "Search registers" },
    { "<leader>/M",  function() require("telescope.builtin").marks() end,        desc = "Search marks" },
    { "<leader>/k",  function() require("telescope.builtin").keymaps() end,      desc = "Search keymaps" },
    { "<leader>/t",  function() require("telescope.builtin").treesitter() end,   desc = "Search treesitter" },
    { "<leader>/gb", function() require("telescope.builtin").git_branches() end, desc = "Search git branches" },
    { "<leader>/gc", function() require("telescope.builtin").git_commits() end,  desc = "Search git commits" },
    { "<leader>/gC", function() require("telescope.builtin").git_bcommits() end, desc = "Search git buffer commits" },
    { "<leader>bc",  function() require("telescope.builtin").git_bcommits() end, desc = "Search git buffer commits" },
    { "<leader>bl",  function() require("telescope.builtin").buffers() end,      desc = "Search buffers" },
    { "<leader>//",  function() require("telescope.builtin").resume() end,       desc = "Resume Telescope" },
    {
      "<leader>/m",
      "<cmd>Telescope macros<cr>",
      desc = "Search macros"
    },
    {
      "<leader>/gr",
      function()
        require('telescope').extensions.advanced_git_search.checkout_reflog()
      end,
      desc = "Git Search: Checkout Reflog"
    },
    {
      "<leader>/gdb",
      function()
        require('telescope').extensions.advanced_git_search.diff_branch_file()
      end,
      desc = "Git Search: Diff branch file"
    },
    {
      "<leader>/gdf",
      function()
        require('telescope').extensions.advanced_git_search.diff_commit_file()
      end,
      desc = "Git Search: Diff commit file"
    },
    {
      "<leader>/gdl",
      function()
        require('telescope').extensions.advanced_git_search.diff_commit_line()
      end,
      desc = "Git Search: Diff commit line"
    },
    {
      "<leader>/gl",
      function()
        require('telescope').extensions.advanced_git_search.search_log_content()
      end,
      desc = "Git Search: Log content"
    },
    {
      "<leader>/gL",
      function()
        require('telescope').extensions.advanced_git_search.search_log_content_file()
      end,
      desc = "Git Search: Log content file"
    },
    {
      "<leader>/m",
      "<cmd>Telescope macros<cr>",
      desc = "Search macros"
    },
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
      -- extensions = {
      --   fzf = {
      --     fuzzy = true,
      --     override_generic_sorter = false, -- override the generic sorter
      --     override_file_sorter = true,     -- override the file sorter
      --     case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      --     -- the default case_mode is "smart_case"
      --   },
      -- },
    })

    if functions.is_macunix() then
      telescope.load_extension("fzf")
    else
      vim.notify("not using fzf")
    end

    -- if pcall(require, "dap") then
    --   telescope.load_extension("dap")
    -- else
    --   vim.notify("telescope not using dap")
    -- end

    if pcall(require, "refactoring") then
      telescope.load_extension("refactoring")
    else
      vim.notify("telescope not using refactoring")
    end

    if pcall(require, "advanced_git_search") then
      telescope.load_extension("advanced_git_search")
    else
      vim.notify("telescope not using advanced_git_search")
    end

    -- if pcall(require, "NeoComposer") then
    --   telescope.load_extension('macros')
    -- else
    --   vim.notify("telescope not using neocomposer")
    -- end
  end,
}
