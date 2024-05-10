return {
  "ibhagwan/fzf-lua",
  branch = "main",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "tpope/vim-fugitive" },
    { "aaronhallaert/advanced-git-search.nvim" },
  },
  keys = {
    {
      "<leader>/c",
      function()
        require("fzf-lua").commands()
      end,
      desc = "Search commands",
    },
    {
      "<leader>/C",
      function()
        require("fzf-lua").command_history()
      end,
      desc = "Search command history",
    },
    {
      "<leader>sl",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "Live grep",
    },
    {
      "<leader>sc",
      function()
        require("lt.plugins.fzf.functions").search_config()
      end,
      desc = "Search neovim config",
    },
    {
      "<leader>s~",
      function()
        require("fzf-lua").files({
          prompt = "< Profile >",
          cwd = "$HOME",
        })
      end,
      desc = "Search profile",
    },
    {
      "<leader>pf",
      function()
        require("fzf-lua").files()
      end,
      desc = "Find files",
    },
    {
      "<leader>pd",
      function()
        local current_file_path = vim.fn.expand("%:p")
        local directory = vim.fn.fnamemodify(current_file_path, ":h")
        require("fzf-lua").files({
          prompt = "< Navigation Bar >",
          cwd = directory,
        })
      end,
      desc = "Navigation bar",
    },
    {
      "<leader>po",
      function()
        require("fzf-lua").oldfiles()
      end,
      desc = "Find files",
    },
    {
      "<leader>pg",
      function()
        require("fzf-lua").git_files()
      end,
      desc = "Find git files",
    },
    {
      "<leader>/h",
      function()
        require("fzf-lua").highlights()
      end,
      desc = "Search highlights",
    },
    {
      "<leader>/r",
      function()
        require("fzf-lua").registers()
      end,
      desc = "Search registers",
    },
    {
      "<leader>/M",
      function()
        require("fzf-lua").marks()
      end,
      desc = "Search marks",
    },
    {
      "<leader>/k",
      function()
        require("fzf-lua").keymaps()
      end,
      desc = "Search keymaps",
    },
    {
      "<leader>/t",
      function()
        require("fzf-lua").treesitter()
      end,
      desc = "Search treesitter",
    },
    {
      "<leader>g/b",
      function()
        require("fzf-lua").git_branches()
      end,
      desc = "Search git branches",
    },
    {
      "<leader>g/c",
      function()
        require("fzf-lua").git_commits()
      end,
      desc = "Search git commits",
    },
    {
      "<leader>g/C",
      function()
        require("fzf-lua").git_bcommits()
      end,
      desc = "Search git buffer commits",
    },
    {
      "<leader>bc",
      function()
        require("fzf-lua").git_bcommits()
      end,
      desc = "Search git buffer commits",
    },
    {
      "<leader>bl",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Search buffers",
    },
    {
      "<leader>//",
      function()
        require("fzf-lua").resume()
      end,
      desc = "Resume FZF",
    },
    {
      "<leader>g/r",
      function()
        require("advanced_git_search.fzf.pickers").checkout_reflog()
      end,
      desc = "Git Search: Checkout Reflog",
    },
    {
      "<leader>g/db",
      function()
        require("advanced_git_search.fzf.pickers").diff_branch_file()
      end,
      desc = "Git Search: Diff branch file",
    },
    {
      "<leader>g/df",
      function()
        require("advanced_git_search.fzf.pickers").diff_commit_file()
      end,
      desc = "Git Search: Diff commit file",
    },
    {
      "<leader>g/dl",
      function()
        require("advanced_git_search.fzf.pickers").diff_commit_line()
      end,
      desc = "Git Search: Diff commit line",
    },
    {
      "<leader>g/l",
      function()
        require("advanced_git_search.fzf.pickers").search_log_content()
      end,
      desc = "Git Search: Log content",
    },
    {
      "<leader>g/L",
      function()
        require("advanced_git_search.fzf.pickers").search_log_content_file()
      end,
      desc = "Git Search: Log content file",
    },
  },
  init = function()
    require("fzf-lua").setup({
      keymap = {
        fzf = {
          ["CTRL-Q"] = "select-all+accept",
        },
      },
    })
    require("fzf-lua").register_ui_select()
    require("advanced_git_search.fzf").setup({})
  end,
}
