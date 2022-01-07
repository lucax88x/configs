local present, aerial = pcall(require, "aerial")

if not present then
	return
end

aerial.setup({
	default_direction = "left",
	on_attach = function(bufnr)
		local r = require("lt.utils.remaps")

		r.noremap("n", "{o", "<cmd>AerialPrev<CR>", "aerial_prev_item", "Aerial previous item", { buffer = bufnr })
		r.noremap("n", "}o", "<cmd>AerialNext<CR>", "aerial_next_item", "Aerial next item", { buffer = bufnr })
		r.noremap(
			"n",
			"[[o",
			"<cmd>AerialPrevUp<CR>",
			"aerial_prev_item_up",
			"Aerial previos item up",
			{ buffer = bufnr }
		)
		r.noremap("n", "]]o", "<cmd>AerialNextUp<CR>", "aerial_next_item_up", "Aerial next item up", { buffer = bufnr })
	end,
})
