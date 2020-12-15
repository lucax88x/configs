addEventListener('LuaHighlight', { 'TextYankPost *' }, function()  
  require'vim.highlight'.on_yank()
end)
