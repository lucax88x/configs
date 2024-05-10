return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = true,
  init = function()
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }

      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
  end,
  keys = {
    {
      "<leader>kg",
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
          cmd = "lazygit",
          direction = "float",
          hidden = true,
        })

        lazygit:toggle()
      end,
      desc = "Open Lazygit (Toggleterm)",
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
      desc = "Open Toggleterm",
    },
  },
}
