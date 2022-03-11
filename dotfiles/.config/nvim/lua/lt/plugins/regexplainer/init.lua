local present, regexplainer = pcall(require, "regexplainer")

if not present then
  vim.notify "Could not load regexplainer"
	return
end

regexplainer.setup {
  -- automatically show the explainer when the cursor enters a regexp
  auto = true,

  -- Whether to log debug messages
  debug = true,

  mappings = {
    show = "gR",
  },
}
