return {
  'NeogitOrg/neogit',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local neogit = require("neogit")

    neogit.setup {
      integrations = {
        diffview = true,
      }
    }
  end,
  keys = {
    { "<leader>gs", function() require("neogit").open() end, desc = "Git status" },
  }
}
