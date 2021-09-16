local present1, autopairs = pcall(require, 'nvim-autopairs')
local present2, autopairs_completion = pcall(require, 'nvim-autopairs.completion.cmp')

if not (present1 or present2) then
	return
end

autopairs.setup()
autopairs_completion.setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})
