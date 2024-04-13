local functions = require("lt.project.functions")

vim.keymap.set("n", "<leader>pp", function()
  functions.switch_project()
end, { desc = "Switch project" })
