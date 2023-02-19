return {
    "jay-babu/mason-null-ls.nvim",
    config = function()
      local mason_null_ls = require("mason-null-ls")

      -- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
      mason_null_ls.setup({
          ensure_installed = nil,
          automatic_installation = true,
          automatic_setup = false,
      })
    end,
    dependencies = { "williamboman/mason.nvim" },
}
