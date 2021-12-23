local lsp = require("lspconfig")

-- npm install -g eslint_d
-- npm install -g @fsouza/prettierd
-- npm install -g stylelint
-- npm install -g alex
-- paru -S stylua
-- paru -S luacheck
-- paru -S shfmt-bin
-- paru -S shellcheck-bin
--
-- https://github.com/creativenull/efmls-configs-nvim/blob/main/supported-linters-and-formatters.md
local alex = require("efmls-configs.linters.alex")
-- local eslint_d = require("efmls-configs.linters.eslint_d")
local prettier_d = require("efmls-configs.formatters.prettier_d")
local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")
local stylelint = require("efmls-configs.linters.stylelint")
local shellcheck = require("efmls-configs.linters.shellcheck")
local shfmt = require("efmls-configs.formatters.shfmt")
local yamllint = require("efmls-configs.linters.yamllint")

local languages = {
	lua = { stylua, luacheck },
	typescript = { prettier_d },
	javascript = { prettier_d },
	typescriptreact = { prettier_d },
	["typescript.tsx"] = { prettier_d },
	javascriptreact = { prettier_d },
	["javascript.jsx"] = { prettier_d },
	vue = { prettier_d, stylelint },
	yaml = { prettier_d, yamllint },
	html = { prettier_d, alex },
	less = { prettier_d, stylelint },
	sass = { prettier_d, stylelint },
	scss = { prettier_d, stylelint },
	css = { prettier_d, stylelint },
	markdown = { prettier_d, alex },
	zsh = { shfmt, shellcheck },
	bash = { shfmt, shellcheck },
	sh = { shfmt, shellcheck },
}

return function()
	return {
		root_dir = function(fname)
			local cwd = lsp.util.root_pattern("tsconfig.json")(fname)
				or lsp.util.root_pattern(".eslintrc.json", ".git")(fname)
				or lsp.util.root_pattern("package.json", ".git/", ".zshrc")(fname)
			return cwd
		end,
		filetypes = vim.tbl_keys(languages),
		init_options = { documentFormatting = true },
		settings = {
			rootMarkers = { "package.json", ".git" },
			lintDebounce = 500,
			languages = languages,
		},
	}
end
