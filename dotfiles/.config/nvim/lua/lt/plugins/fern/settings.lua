vim.api.nvim_exec(
[[
let g:fern#renderer = "nerdfont"
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
augroup END
]],
true)

-- vim.g.fern = { renderer = 'nerdfont' }
--[[ addEventListener('glyph-palette', { 'FileType fern' }, function()
  vim.api.nvim_eval('glyph_palette#apply()')
end) ]]
