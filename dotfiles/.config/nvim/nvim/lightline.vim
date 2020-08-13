let g:lightline = {
  \   'colorscheme': 'gruvbox',
  \   'active': {
  \     'left':  [
  \              [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ],
  \     'right': [
  \              [ 'lineinfo' ],
  \              [ 'fileformat', 'fileencoding', 'filetype'  ]
  \     ],
  \   },
	\   'component': {
	\     'lineinfo': '%3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   },
  \   'subseparator': {'left': '\uE0B5', 'right': '\uE0B7'},
  \   'separator': {'left': '', 'right': ''},
  \ }

" let g:lightline.separator = {
" 	\   'left': '', 'right': ''
"   \}
" let g:lightline.subseparator = {
" 	\   'left': '', 'right': ''
"   \}

