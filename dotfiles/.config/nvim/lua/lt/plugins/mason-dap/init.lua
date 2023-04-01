return {
  "jay-babu/mason-nvim-dap.nvim",
  cmd = "Mason",
  config = function()
    local mason_dap = require("mason-nvim-dap")

    -- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
    mason_dap.setup({
      ensure_installed = {
        "js",
        "delve",
      },
      auto_update = false,
      run_on_start = false,
      automatic_setup = true,
    })

    mason_dap.setup_handlers {}
  end,
  dependencies = { "williamboman/mason.nvim" },
}
