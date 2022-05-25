local present, pretty_fold = pcall(require, "pretty-fold")
local present_preview, pretty_fold_preview = pcall(require, "pretty-fold.preview")

if not present then
	return
end

pretty_fold.setup({
	keep_indentation = false,
	fill_char = "━",
	sections = {
		left = {
			"━ ",
			function()
				return string.rep("*", vim.v.foldlevel)
			end,
			" ━┫",
			"content",
			"┣",
		},
		right = {
			"┫ ",
			"number_of_folded_lines",
			": ",
			"percentage",
			" ┣━━",
		},
	},
})

if not present_preview then
	return
end

pretty_fold_preview.setup({})
