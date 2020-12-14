if vim.g.started_by_firenvim then
  vim.g.laststatus = 0

  nnoremap('<Esc><Esc>', '=call firenvim#focus_page()<CR>')
  nnoremap('<C-z>', '=write<CR>=call firenvim#hide_frame()<CR>')

  vim.g.firenvim_config = {
      globalSettings= {
          alt= all,
      },
      localSettings= {
          [".*"] = {
              cmdline= neovim,
              priority= 0,
              selector= textarea,
              takeover= always,
          },
          -- ["https?=//twitter.com"] = { takeover= never, priority= 1 }
          -- ["https?=//docs.google.com"] = { takeover= never, priority= 1 }
      }
  }

  vim.cmd('au BufEnter github.com_*.txt set filetype=markdown')
end
