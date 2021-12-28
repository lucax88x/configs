local present = pcall(require, "dap")

if not present then
	return
end

-- dap.set_log_level("TRACE")

local r = require("lt.utils.remaps")

r.whick_key("<leader>dd", "debugger")
r.whick_key("<leader>dds", "step")
r.whick_key("<leader>db", "breakpoints")
r.whick_key("<leader>dv", "variables")
r.whick_key("<leader>dw", "widgets")
r.whick_key("<leader>dr", "repl")

r.nnoremap("<leader>ddc", '<cmd>lua require"dap".continue()<CR>', "dap", "dap_start_continue", "Start/Continue")
r.nnoremap("<leader>ddsv", '<cmd>lua require"dap".step_over()<CR>', "dap", "dap_step_over", "Step over")
r.nnoremap("<leader>ddsi", '<cmd>lua require"dap".step_into()<CR>', "dap", "dap_step_into", "Step into")
r.nnoremap("<leader>ddso", '<cmd>lua require"dap".step_out()<CR>', "dap", "dap_step_out", "Step out")

r.nnoremap(
	"<leader>dbt",
	'<cmd>lua require"dap".toggle_breakpoint()<CR>',
	"dap",
	"dap_toggle_breakpoint",
	"Toggle breakpoint"
)
r.nnoremap(
	"<leader>dbc",
	'<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
	"dap",
	"dap_set_breakpoint",
	"Set breakpoint"
)
-- r.nnoremap(
-- 	"<leader>dbm",
-- 	'<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
-- 	"dap",
-- 	"dap_set_breakpoint",
-- 	"Set breakpoint"
-- )

r.nnoremap("<leader>dvc", '<cmd>lua require"dap.ui.variables".scopes()<CR>', "dap", "dap_scopes", "Variables scopes")
r.nnoremap(
	"<leader>dvh",
	'<cmd>lua require"dap.ui.variables".hover()<CR>',
	"dap",
	"dap_variables_hover",
	"Variables hover"
)
r.vnoremap(
	"<leader>dvv",
	'<cmd>lua require"dap.ui.variables".visual_hover()<CR>',
	"dap",
	"dap_visual_hover",
	"Visual hover"
)

r.nnoremap("<leader>dwh", '<cmd>lua require"dap.ui.widgets".hover()<CR>', "dap", "dap_widgets_hover", "Widgets hover")
r.nnoremap(
	"<leader>dwf",
	"<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>",
	"dap",
	"dap_widgets_scopes",
	"Widgets scopes"
)

r.nnoremap("<leader>dro", '<cmd>lua require"dap".repl.open()<CR>', "dap", "repl_open", "Open REPL")
r.nnoremap("<leader>drl", '<cmd>lua require"dap".repl.run_last()<CR>', "dap", "repl_run_last", "REPL last")

r.nnoremap(
	"<leader>dl",
	'<cmd>lua print(vim.fn.stdpath("cache") .. "/dap.log")<CR>',
	"dap",
	"dap_log_folder",
	"Show log path"
)

r.nnoremap(
	"<leader>/dcc",
	'<cmd>lua require"telescope".extensions.dap.commands{}<CR>',
	"telescope",
	"dap_commands",
	"DAP commands"
)

r.nnoremap(
	"<leader>/dco",
	'<cmd>lua require"telescope".extensions.dap.configurations{}<CR>',
	"telescope",
	"dap_configurations",
	"DAP configurations"
)

r.nnoremap(
	"<leader>/db",
	'<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>',
	"telescope",
	"dap_list_breakpoints",
	"DAP list breakpoints"
)

r.nnoremap(
	"<leader>/dv",
	'<cmd>lua require"telescope".extensions.dap.variables{}<CR>',
	"telescope",
	"dap_variables",
	"DAP variables"
)

r.nnoremap(
	"<leader>/df",
	'<cmd>lua require"telescope".extensions.dap.frames{}<CR>',
	"telescope",
	"dap_frames",
	"DAP frames"
)
