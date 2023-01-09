return {
  "theHamsta/nvim-dap-virtual-text",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local dap_virtual_text = require("nvim-dap-virtual-text")

    dap_virtual_text.setup({})
  end,
}
