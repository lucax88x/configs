local fn = vim.fn

vim.cmd([[packadd packer.nvim]])

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

-- remove the dir before cloning
if fn.empty(fn.glob(install_path)) > 0 then
	print("Cloning packer..")
	fn.delete(install_path, "rf")

	fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
		prompt_border = "single",
	},
	git = {
		clone_timeout = 600, -- Timeout, in seconds, for git clones
	},
	auto_clean = true,
	compile_on_sync = true,
	--    auto_reload_compiled = true
})

return packer.startup({

	function(use)
		use({ "wbthomason/packer.nvim", event = "VimEnter" })

		use({
			"antoinemadec/FixCursorHold.nvim",
			config = function()
				require("lt.plugins.fix-cursorhold")
			end,
		}) -- Fix CursorHold Performance

		use("nvim-lua/plenary.nvim")

		use({
			"lazytanuki/nvim-mapper",
			config = function()
				require("lt.plugins.nvim-mapper")
			end,
			before = "telescope.nvim",
		})

		use("MunifTanjim/nui.nvim") -- ui library

		use({
			"rcarriga/nvim-notify", -- notifications
			config = function()
				require("lt.plugins.nvim-notify")
			end,
		})

		-- icons
		use("kyazdani42/nvim-web-devicons")

		use({
			"goolord/alpha-nvim",
			event = "BufWinEnter",
			config = function()
				require("lt.plugins.alpha")
			end,
		})

		use({
			"tpope/vim-fugitive",
			config = function()
				require("lt.plugins.fugitive")
			end,
		})
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("lt.plugins.gitsigns")
			end,
		})

		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("lt.plugins.project")
			end,
		})
		use({
			"shatur/neovim-session-manager",
			config = function()
				require("lt.plugins.neovim-session-manager")
			end,
		})

		use("mbbill/undotree") -- undo tree
		use({
			"kevinhwang91/nvim-bqf",
			config = function()
				require("lt.plugins.nvim-bqf")
			end,
		})

		use({
			"jdhao/better-escape.vim",
			config = function()
				require("lt.plugins.better-escape")
			end,
		})

		use({
			"ggandor/lightspeed.nvim",
			config = function()
				require("lt.plugins.lightspeed-nvim")
			end,
		})

		use("JoosepAlviste/nvim-ts-context-commentstring")

		use({
			"numToStr/Comment.nvim",
			config = function()
				require("lt.plugins.comment-nvim")
			end,
		})

		use("tpope/vim-surround") -- Change surrounding arks
		use("tpope/vim-repeat") -- extends . repeat, for example for make it work with vim-sneak
		use({
			"bkad/CamelCaseMotion",
			config = function()
				require("lt.plugins.camelcasemotion")
			end,
		}) -- allows to move by camelCase with w e
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("lt.plugins.indent-blankline")
			end,
		})

		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
			config = function()
				require("lt.plugins.telescope")
			end,
		})
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

		use({
			"dyng/ctrlsf.vim",
			config = function()
				require("lt.plugins.ctrlsf")
			end,
		})
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("lt.plugins.nvim-colorizer")
			end,
		}) -- preview hex colors

		use("rrethy/vim-illuminate") -- highlight matching words when cursor on it

		use("gennaro-tedesco/nvim-peekup") -- shows register preview
		use("numtostr/BufOnly.nvim") -- deletes all buffers except
		use({
			"karb94/neoscroll.nvim",
			config = function()
				require("lt.plugins.neoscroll")
			end,
		})
		use("romainl/vim-cool") -- disabled search highlight until next search
		use({
			"ThePrimeagen/refactoring.nvim",
			config = function()
				require("lt.plugins.refactoring")
			end,
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-treesitter/nvim-treesitter" },
			},
		})

		use({
			"kyazdani42/nvim-tree.lua",
			config = function()
				require("lt.plugins.nvim-tree")
			end,
		})

		use("tpope/vim-abolish") -- :S to replace with smartcase

		-- Autocomplete & Linters
		use("neovim/nvim-lspconfig")
		use("nvim-lua/lsp-status.nvim")
		use("jose-elias-alvarez/null-ls.nvim")
		use({
			"tami5/lspsaga.nvim",
			config = function()
				require("lt.plugins.lspsaga")
			end,
		})
		use({
			"folke/trouble.nvim",
			config = function()
				require("lt.plugins.trouble-nvim")
			end,
		})
		use({
			"filipdutescu/renamer.nvim",
			config = function()
				require("lt.plugins.renamer-nvim")
			end,
		})
		use("onsails/lspkind-nvim")
		use("ray-x/lsp_signature.nvim")
		use("jose-elias-alvarez/nvim-lsp-ts-utils")
		use("williamboman/nvim-lsp-installer")
		use("b0o/schemastore.nvim")
		use({
			"creativenull/efmls-configs-nvim",
			requires = { "neovim/nvim-lspconfig" },
		})
		use({
			"github/copilot.vim",
			config = function()
				require("lt.plugins.copilot")
			end,
		})
		use({
			"stevearc/aerial.nvim",
			config = function()
				require("lt.plugins.aerial-nvim")
			end,
		})
		use({
			"simrat39/rust-tools.nvim",
			requires = "nvim-lua/plenary.nvim",
		})

		-- Snippets
		use({
			"L3MON4D3/LuaSnip",
			requires = { "rafamadriz/friendly-snippets" },
			config = function()
				require("lt.plugins.snippets")
			end,
		})

		use({
			"hrsh7th/nvim-cmp",
			config = function()
				require("lt.plugins.nvim-cmp")
			end,
			event = "InsertEnter",
		})

		use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
		use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })

		use({
			"windwp/nvim-autopairs",
			after = "nvim-cmp",
			config = function()
				require("lt.plugins.nvim-autopairs")
			end,
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("lt.plugins.treesitter")
			end,
			run = function()
				vim.cmd([[TSUpdate]])
			end,
		})
		use("nvim-treesitter/playground")

		use("haringsrob/nvim_context_vt") -- shows treesitter context in end of parenthesis
		use("RRethy/nvim-treesitter-textsubjects")
		use("nvim-treesitter/nvim-treesitter-textobjects")

		use({
			"andymass/vim-matchup", -- enhances %
			config = function()
				require("lt.plugins.vim-matchup")
			end,
		})
		use({
			"folke/todo-comments.nvim",
			config = function()
				require("lt.plugins.todo-comments")
			end,
		})

		use({
			"ThePrimeagen/harpoon",
			config = function()
				require("lt.plugins.harpoon")
			end,
			requires = "nvim-lua/plenary.nvim",
		})

		use({
			"kdav5758/TrueZen.nvim",
			config = function()
				require("lt.plugins.truezen")
			end,
		})

		-- Theming
		use("gruvbox-community/gruvbox")

		-- status line
		use({
			"SmiteshP/nvim-gps",
			requires = "nvim-treesitter/nvim-treesitter",
			config = function()
				require("lt.plugins.nvim-gps")
			end,
		})

		use({
			"NTBBloodbath/galaxyline.nvim",
			requires = "SmiteshP/nvim-gps",
			config = function()
				require("lt.plugins.galaxyline")
			end,
		})
	end,
})
