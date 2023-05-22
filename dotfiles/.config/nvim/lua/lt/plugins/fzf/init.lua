return {
  'ibhagwan/fzf-lua',
  requires = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { "<leader>/c", function() require("fzf-lua").commands() end,        desc = "Search commands" },
    { "<leader>/C", function() require("fzf-lua").command_history() end, desc = "Search command history" },
    { "<leader>sl", function() require("fzf-lua").live_grep() end,       desc = "Live grep" },
    -- { "<leader>sL", function()
    --   require("fzf-lua").live_grep({
    --     prompt = "< Config >",
    --     cwd = "cwd?",
    --   })
    -- end, desc = "Search neovim config" },
    {
      "<leader>sc",
      function()
        require("fzf-lua").files({
          prompt = "< Config >",
          cwd = "$HOME/.config/nvim",
        })
      end,
      desc = "Search neovim config"
    },
    { "<leader>pf", function() require("fzf-lua").files() end,     desc = "Find files" },
    { "<leader>po", function() require("fzf-lua").oldfiles() end,  desc = "Find files" },
    { "<leader>pg", function() require("fzf-lua").git_files() end, desc = "Find git files" },
    {
      "<leader>pp",
      function()
        require("lt.plugins.project.functions").switch_project()
      end,
      desc = "Switch projects"
    },
    { "<leader>/h",  function() require("fzf-lua").highlights() end,   desc = "Search highlights" },
    { "<leader>/r",  function() require("fzf-lua").registers() end,    desc = "Search registers" },
    { "<leader>/M",  function() require("fzf-lua").marks() end,        desc = "Search marks" },
    { "<leader>/k",  function() require("fzf-lua").keymaps() end,      desc = "Search keymaps" },
    { "<leader>/t",  function() require("fzf-lua").treesitter() end,   desc = "Search treesitter" },
    { "<leader>/gb", function() require("fzf-lua").git_branches() end, desc = "Search git branches" },
    { "<leader>/gc", function() require("fzf-lua").git_commits() end,  desc = "Search git commits" },
    { "<leader>/gC", function() require("fzf-lua").git_bcommits() end, desc = "Search git buffer commits" },
    { "<leader>bc",  function() require("fzf-lua").git_bcommits() end, desc = "Search git buffer commits" },
    { "<leader>bl",  function() require("fzf-lua").buffers() end,      desc = "Search buffers" },
    { "<leader>//",  function() require("fzf-lua").resume() end,       desc = "Resume FZF" },
  },
  config = function()
    require('fzf-lua').setup({
      keymap = {
        fzf = {
          ['CTRL-Q'] = 'select-all+accept',
        },
      },
    })
  end,
  init = function()
    require("fzf-lua").register_ui_select()
  end
}