require'bufferline'.setup{
    diagnostics = 'nvim_lsp',
    mappings = false,
    -- separator_style = "slant
    highlights = {
        buffer_selected = {
            guifg = '#a89984',
            guibg = '#38393f',
        },
        tab = {
            guibg = '#282828'
        },
        fill = {
            guibg = '#282828',
        },
        background = {
            guibg = '#282828',
        },
        separator = {
            guibg = '#282828',
        },
    }
}
