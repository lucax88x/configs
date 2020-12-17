vim.g.which_key_map = {
  g = { name = 'git' },
  t = { name = 'types' },
  b = { name = 'buffers' },
  p = { name = 'projects' },
  f = { name = 'fixes' },
  s = { name = 'sessions' },
  m = { name = 'marks' },
  w = { name = 'windows' },
  r = {
    name = 'refactor',
    l = { name  = 'line' },
    p = { name  = 'parameter' }
  },
}
vim.cmd('call which_key#register(\'<leader>\', "g:which_key_map")')

-- autocmd! FileType which_key
-- autocmd  FileType which_key set laststatus=0 noshowmode noruler
--   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
