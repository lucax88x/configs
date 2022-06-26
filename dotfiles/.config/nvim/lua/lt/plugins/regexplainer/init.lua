local present, regexplainer = pcall(require, "regexplainer")

if not present then
  vim.notify("Could not load regexplainer")
  return
end

regexplainer.setup({
  -- automatically show the explainer when the cursor enters a regexp
  auto = true,

  -- Whether to log debug messages
  debug = false,
})

local r = require("lt.utils.remaps")

r.which_key("<leader>tr", "regex")

r.noremap("n", "<leader>trs", function()
  regexplainer.show()
end, "Show Regexplainer")
r.noremap("n", "<leader>trh", function()
  regexplainer.hide()
end, "Hide Regexplainer")
