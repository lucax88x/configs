nnoremap('f', ':<C-U>call sneak#wrap("",           1, 0, 1, 1)<CR>')
nnoremap('F', ':<C-U>call sneak#wrap("",           1, 1, 1, 1)<CR>')
xnoremap('f',  ':<C-U>call sneak#wrap(visualmode(), 1, 0, 1, 1)<CR>')
xnoremap('F',  ':<C-U>call sneak#wrap(visualmode(), 1, 1, 1, 1)<CR>')
onoremap('f',  ':<C-U>call sneak#wrap(v:operator,   1, 0, 1, 1)<CR>')
onoremap('F',  ':<C-U>call sneak#wrap(v:operator,   1, 1, 1, 1)<CR>')