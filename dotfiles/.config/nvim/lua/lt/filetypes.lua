addEventListener('set to javascript.jsx', { 'BufNewFile,BufRead *.jsx' }, function ()
  vim.cmd('set filetype=javascript.jsx')
end)

addEventListener('set to typescript.tsx', { 'BufNewFile,BufRead *.tsx' }, function ()
  vim.cmd('set filetype=typescript.tsx')
end)
