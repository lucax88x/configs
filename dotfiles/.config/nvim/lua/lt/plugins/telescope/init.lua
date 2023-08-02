return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "aaronhallaert/advanced-git-search.nvim" },
  },
  cmd = "Telescope",
  keys = {
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
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    })

    if functions.is_macunix() then
      vim.notify("using fzf")
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

    if pcall(require, "NeoComposer") then
      telescope.load_extension('macros')
    else
      vim.notify("telescope not using neocomposer")
    end
  end,
}
