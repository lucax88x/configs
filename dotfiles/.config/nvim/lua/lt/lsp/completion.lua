require'compe'.setup {
  enabled = true,
  debug = false,
  min_length = 2,
  -- preselect = 'enable' || 'disable' || 'always';
  -- throttle_time = ... number ...;
  -- source_timeout = ... number ...;
  -- incomplete_delay = ... number ...;
  -- allow_prefix_unmatch = false;
  neorg = true,
  source = {
    vsnip = {
      filetypes = {'markdown', 'json', 'yaml', 'css', 'scss', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'typescript.tsx', 'shell', 'cs', 'dockerfile'},
    },
    nvim_lua = { 'lua' },
    nvim_lsp = {
      filetypes = {'markdown', 'json', 'yaml', 'css', 'scss', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' ,'typescript.tsx', 'shell', 'cs', 'dockerfile'}
    },
    path = true,
    buffer =  true,
  }
}
