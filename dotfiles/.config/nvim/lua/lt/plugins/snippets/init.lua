local present, luasnip = pcall(require, "luasnip")
if not present then
	return
end

luasnip.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

require("luasnip.loaders.from_vscode").lazy_load()

local r = require("lt.utils.remaps")

r.map({ "i", "s" }, "<c-n>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, "Expand current snippet or jump to next", { silent = true })

r.map({ "i", "s" }, "<c-p>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, "Go to previous snippet", { silent = true })

r.map("i", "<c-l>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, "Show list of options")

-- vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
