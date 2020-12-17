addEventListener('update lightline when lsp diagnostics is updated', { 'User LspDiagnosticsChanged', 'User LspMessageUpdate', 'User LspStatusUpdate' }, function ()
  vim.cmd('call lightline#update()')
end)
