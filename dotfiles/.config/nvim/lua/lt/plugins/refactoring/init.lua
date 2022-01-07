local present, refactoring = pcall(require, "refactoring")

if not present then
	return
end

refactoring.setup({})

local r = require("lt.utils.remaps")

r.whick_key("<leader>te", "extract")
r.whick_key("<leader>ti", "inline")

r.noremap("v", "<leader>tef", function()
	refactoring.refactor("Extract Function")
end, "refactoring_extract_function", "Extract Function")

r.noremap("v", "<leader>teF", function()
	refactoring.refactor("Extract Function To File")
end, "refactoring_extract_function_to_file", "Extact Function to file")

r.noremap("v", "<leader>tev", function()
	refactoring.refactor("Extract Variable")
end, "refactoring_extract_variable", "Extact variable")

r.noremap("v", "<leader>tiv", function()
	refactoring.refactor("Inline Variable")
end, "refactoring_inline_variable", "Inline variable")
