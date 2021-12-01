local actions = require 'telescope.actions'
local telescope = require 'telescope'
local functions = require 'lt.utils.functions'

telescope.setup {
    defaults = {
        sorting_strategy = 'descending',
        layout_strategy = 'horizontal',
        layout_config = {prompt_position = 'bottom'},
    },
    pickers = {
        buffers = {sort_lastused = true, previewer = false, theme = 'dropdown'},
        find_files = {previewer = false, theme = 'dropdown'},
        git_files = {previewer = false, theme = 'dropdown'},
        registers = {theme = 'dropdown'},
        lsp_references = { previewer = false },
        lsp_code_actions = {theme = 'cursor'},
        lsp_range_code_actions = {theme = 'cursor'},
        loclist = {previewer = false}
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case' -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}

functions.link_highlight('TelescopeBorder', 'GruvboxBg2', true)
functions.link_highlight('TelescopePromptBorder', 'GruvboxBg2', true)
functions.link_highlight('TelescopeResultsBorder', 'GruvboxBg2', true)
functions.link_highlight('TelescopePreviewBorder', 'GruvboxBg2', true)

if functions.is_linux() then telescope.load_extension('fzf') end

if (pcall(require, 'nvim-mapper')) then
  telescope.load_extension('mapper')
end
if (pcall(require, 'project_nvim')) then
  telescope.load_extension('projects')
end
if (pcall(require, 'session-manager')) then
  telescope.load_extension('sessions')
end


