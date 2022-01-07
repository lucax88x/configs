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

local r = require("lt.utils.remaps")

r.noremap(
	{ "n", "v", "o" },
	"n",
	"<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>",
	"hlslens_next_n",
	"Next search by n",
	{ silent = true }
)
r.noremap(
	{ "n", "v", "o" },
	"N",
	"<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
	"hlslens_prev_n",
	"Previous search br N",
	{ silent = true }
)
r.noremap(
	{ "n", "v", "o" },
	"*",
	"*<Cmd>lua require('hlslens').start()<CR>",
	"hlslens_next_*",
	"Next search (by *)",
	{ silent = true }
)
r.noremap(
	{ "n", "v", "o" },
	"#",
	"#<Cmd>lua require('hlslens').start()<CR>",
	"hlslens_previous_#",
	"Previous search (by #)",
	{ silent = true }
)

r.noremap(
	{ "n", "v", "o" },
	"g*",
	"g*<Cmd>lua require('hlslens').start()<CR>",
	"hlslens_next_g*",
	"Next search (by *)",
	{ silent = true }
)

r.noremap(
	{ "n", "v", "o" },
	"g#",
	"g#<Cmd>lua require('hlslens').start()<CR>",
	"hlslens_previous_g#",
	"Previous search (by #)",
	{ silent = true }
)
