return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap" },
  keys = { "<leader>du" },
  init = function()
    local r = require("lt.utils.remaps")

    r.noremap("n", "<leader>du", function()
      local dap_ui = require("dapui")
      dap_ui.toggle()
    end, "Toggle DAP UI")
  end,
  config = function()
    local dap_ui = require("dapui")
    dap_ui.setup({})
  end,
}
