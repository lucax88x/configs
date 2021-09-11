local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup{
    defaults = {
        timeoutlen = 2000,
        mappings = {i = {["<esc>"] = actions.close, }},
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_prefix = ">",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "bottom"
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {".backup",".swap",".langservers",".session",".undo","*.git","node_modules","vendor",".cache",".vscode-server",".Desktop",".Documents","classes"},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        path_display  = { 'shorten' },
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.cat.new,
        grep_previewer = require'telescope.previewers'.vimgrep.new,
        qflist_previewer = require'telescope.previewers'.qflist.new,

        -- Developer configurations: Not meant for general override
        -- buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
    pickers = {
    -- Your special builtin config goes in here
      buffers = {
        sort_lastused = true,
        previewer = false,
        theme = "dropdown",
      },
      find_files = {
        previewer = false,
        theme = "dropdown",
      },
      git_files = {
        previewer = false,
        theme = "dropdown",
      },
      registers = {
        theme = "dropdown",
      },
      lsp_code_actions = {
        theme = "cursor",
      },
      lsp_range_code_actions = {
        theme = "cursor",
      },
    },
    extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        }
    }
}

vim.cmd[[highlight link TelescopeBorder         GruvboxBg2]]
vim.cmd[[highlight link TelescopePromptBorder   GruvboxBg2]]
vim.cmd[[highlight link TelescopeResultsBorder  GruvboxBg2]]
vim.cmd[[highlight link TelescopePreviewBorder  GruvboxBg2]]

telescope.load_extension("mapper")
telescope.load_extension("fzf")
telescope.load_extension("projects")

