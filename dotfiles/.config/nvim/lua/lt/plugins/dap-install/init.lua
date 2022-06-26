local present, dap_install = pcall(require, "dap-install")

if not present then
  return
end

dap_install.setup({})
dap_install.config("chrome", {})

local r = require("lt.utils.remaps")

r.which_key("<leader>ds", "servers")

r.noremap("n", "<leader>dsi", function()
  require("lt.plugins.dap-install.functions").dap_install_servers()
end, "dap_install_server", "Install DAP servers")

r.noremap("n", "<leader>dsl", "<cmd>DIList<CR>", "DAP servers install info")
