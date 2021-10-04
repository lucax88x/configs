local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- default mappings
local list = {
    {key = {'<CR>', 'o', '<2-LeftMouse>'}, cb = tree_cb('edit')},
    {key = {'<2-RightMouse>', '<C-]>'}, cb = tree_cb('cd')},
    {key = '<C-v>', cb = tree_cb('vsplit')},
    {key = '<C-x>', cb = tree_cb('split')},
    {key = '<C-t>', cb = tree_cb('tabnew')},
    {key = '<', cb = tree_cb('prev_sibling')},
    {key = '>', cb = tree_cb('next_sibling')},
    {key = 'P', cb = tree_cb('parent_node')},
    {key = '<BS>', cb = tree_cb('close_node')},
    {key = '<S-CR>', cb = tree_cb('close_node')},
    {key = '<Tab>', cb = tree_cb('preview')},
    {key = 'K', cb = tree_cb('first_sibling')},
    {key = 'J', cb = tree_cb('last_sibling')},
    {key = 'I', cb = tree_cb('toggle_ignored')},
    {key = 'H', cb = tree_cb('toggle_dotfiles')},
    {key = 'R', cb = tree_cb('refresh')}, {key = 'a', cb = tree_cb('create')},
    {key = 'd', cb = tree_cb('remove')}, {key = 'r', cb = tree_cb('rename')},
    {key = '<C-r>', cb = tree_cb('full_rename')},
    {key = 'x', cb = tree_cb('cut')}, {key = 'c', cb = tree_cb('copy')},
    {key = 'p', cb = tree_cb('paste')}, {key = 'y', cb = tree_cb('copy_name')},
    {key = 'Y', cb = tree_cb('copy_path')},
    {key = 'gy', cb = tree_cb('copy_absolute_path')},
    {key = '[c', cb = tree_cb('prev_git_item')},
    {key = ']c', cb = tree_cb('next_git_item')},
    {key = 's', cb = tree_cb('system_open')},
    {key = '-', cb = tree_cb('close')}, {key = 'q', cb = tree_cb('close')},
    {key = 'g?', cb = tree_cb('toggle_help')}
}

vim.g.nvim_tree_show_icons = {git = 0, folders = 1, files = 1}

vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_group_empty = 1

require'nvim-tree'.setup {
    open_on_setup = false,
    open_on_tab = false,
    update_cwd = false,
    auto_close = false,
    lsp_diagnostics = false,
    follow = 1,
    update_focused_file = {enable = true, update_cwd = false, ignore_list = {}},
    view = {
        -- width of the window, can be either a number (columns) or a string in `%`
        width = 50,
        -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
        side = 'left',
        -- if true the tree will resize itself after opening a file
        auto_resize = false,
        mappings = {
            -- custom only false will merge the list with the default mappings
            -- if true, it will only use your list to set the mappings
            custom_only = false,
            list = list
        }
    },
    show_icons = {git = false, folders = true, files = true}
}
