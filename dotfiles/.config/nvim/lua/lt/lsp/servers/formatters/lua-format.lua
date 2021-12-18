-- paru -S lua-format-git
local luaformat = {
  formatCommand = 'lua-format -i --double-quote-to-single-quote --indent-width=2 --tab-width=2',
  formatStdin = true
}
return luaformat
