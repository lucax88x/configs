local present, hlslens = pcall(require, "hlslens")
local present_scrollbar, scrollbar = pcall(require, "scrollbar")

if not present then
	return
end

hlslens.setup({
	build_position_cb = function(plist)
    if present_scrollbar then
      scrollbar.search_handler.show(plist.start_pos)
    end
	end,
})

if present_scrollbar then
  vim.cmd([[
      augroup scrollbar_search_hide
        autocmd!
        autocmd CmdlineLeave : lua require('scrollbar').search_handler.hide()
      augroup END
  ]])
end
