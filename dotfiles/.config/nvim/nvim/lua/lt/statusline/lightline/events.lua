addEventListener('update lightline when lsp diagnostics is updated', { 'User LspDiagnosticsChanged' }, function ()
  vim.cmd('call lightline#update()')
end)
