vim.g.peekaboo_delay = 100

-- TODO: convert to lua

-- vim.api.nvim_exec(
-- [[
--  function! CreateCenteredFloatingWindow()
--      let width = float2nr(&columns * 0.6)
--      let height = float2nr(&lines * 0.6)
--      let top = ((&lines - height) / 2) - 1
--      let left = (&columns - width) / 2
--      let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

--      let top = "╭" . repeat("─", width - 2) . "╮"
--      let mid = "│" . repeat(" ", width - 2) . "│"
--      let bot = "╰" . repeat("─", width - 2) . "╯"
--      let lines = [top] + repeat([mid], height - 2) + [bot]
--      let buf = nvim_create_buf(v:false, v:true)
--      call nvim_buf_set_lines(buf, 0, -1, v:true, lines)
--      call nvim_open_win(buf, v:true, opts)
--      set winhl=Normal:Floating
--      let opts.row += 1
--      let opts.height -= 2
--      let opts.col += 2
--      let opts.width -= 4
--      call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
--      au BufWipeout <buffer> exe 'bw '.buf
--  endfunction
-- ]],
-- true)

-- vim.g.peekaboo_window = "call CreateCenteredFloatingWindow()"
vim.g.peekaboo_window = 'vert bo 60new'
