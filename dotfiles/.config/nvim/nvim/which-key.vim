let g:which_key_map = {}

let g:which_key_map.g = {
            \ 'name':"git",
            \}

let g:which_key_map.t = {
            \ 'name':"types",
            \}

let g:which_key_map.c = {
            \ 'name':"CoC",
            \}

let g:which_key_map.b = {
            \ 'name':"buffers",
            \}

let g:which_key_map.p = {
            \ 'name':"project",
            \}

let g:which_key_map.f = {
            \ 'name':"fix",
            \}

let g:which_key_map.s = {
            \ 'name':"session",
            \}

let g:which_key_map.m = {
            \ 'name':"marks",
            \}

let g:which_key_map.r = {
            \ 'name':"refactor",
            \ 'l': {
            \  'name': "line"
            \ },
            \ 'p': {
            \  'name': "parameter"
            \ }
            \}

call which_key#register('<Space>', "g:which_key_map")
