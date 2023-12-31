return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = true,
  keys = {
    {
      "<leader>kg",
      function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit  = Terminal:new({
          cmd = "lazygit",
          direction = "float",
          hidden = true
        })

        lazygit:toggle()
      end,
      desc = "Open Lazygit (Toggleterm)"
    },
    -- {
    --   "<leader>kk",
    --   function()
    --     local Terminal = require('toggleterm.terminal').Terminal
    --     local terminal = Terminal:new({
    --       direction = "float",
    --     })
    --
    --     terminal:toggle()
    --   end,
    --   desc = "Open Toggleterm"
    -- },
    {
      "<leader>kk",
      "<Cmd>ToggleTerm direction=float<CR>",
      desc = "Open Toggleterm"
    },
  }
}
