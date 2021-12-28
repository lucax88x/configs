local present, refactor = pcall(require, "refactoring")

if not present then
	return
end

refactor.setup({})

local r = require("lt.utils.remaps")

r.whick_key("<leader>te", "extract")
r.whick_key("<leader>ti", "inline")

r.vnoremap(
	"<leader>tef",
	[[ <Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
	"refactoring",
	"refactoring_extract_function",
	"Extract Function"
)

r.vnoremap(
	"<leader>teF",
	[[ <Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
	"refactoring",
	"refactoring_extract_function_to_file",
	"Extact Function to file"
)

r.vnoremap(
	"<leader>tev",
	[[ <Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
	"refactoring",
	"refactoring_extract_variable",
	"Extact variable"
)

r.vnoremap(
	"<leader>tiv",
	[[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
	"refactoring",
	"refactoring_inline_variable",
	"Inline variable"
)
