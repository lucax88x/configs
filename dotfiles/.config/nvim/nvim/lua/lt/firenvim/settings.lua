-- TODO: convert to lua

vim.api.nvim_exec(
[[
  if exists('g:started_by_firenvim')
    set laststatus=0

    nnoremap <silent> <Esc><Esc> :call firenvim#focus_page()<CR>
    nnoremap <silent> <C-z> :write<CR>:call firenvim#hide_frame()<CR>

    let g:firenvim_config = {
        \ 'globalSettings': {
            \ 'alt': 'all',
        \  },
        \ 'localSettings': {
            \ '.*': {
                \ 'cmdline': 'neovim',
                \ 'priority': 0,
                \ 'selector': 'textarea',
                \ 'takeover': 'always',
            \ },
        \ }
    \ }

    let fc = g:firenvim_config['localSettings']
    let fc['https?://twitter.com'] = { 'takeover': 'never', 'priority': 1 }
    let fc['https?://docs.google.com'] = { 'takeover': 'never', 'priority': 1 }

    au BufEnter github.com_*.txt set filetype=markdown
  endif
]],
true)

