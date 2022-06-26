local vim = vim
local present, dap = pcall(require, "dap")

if not present then
  return
end

-- dap.set_log_level("TRACE")

local r = require("lt.utils.remaps")

-- TODO: consider switching to hydra

r.which_key("<leader>dd", "debugger")
r.which_key("<leader>dds", "step")
r.which_key("<leader>db", "breakpoints")
r.which_key("<leader>dv", "variables")
r.which_key("<leader>dw", "widgets")
r.which_key("<leader>dr", "repl")
r.which_key("<leader>/d", "dap")

r.noremap("n", "<leader>ddc", dap.continue, "Start/Continue")
r.noremap("n", "<leader>ddsv", dap.step_over, "Step over")
r.noremap("n", "<leader>ddsi", dap.step_into, "Step into")
r.noremap("n", "<leader>ddso", dap.step_out, "Step out")

r.noremap("n", "<leader>dbt", dap.toggle_breakpoint, "Toggle breakpoint")
r.noremap("n", "<leader>dbc", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, "Set breakpoint")
-- r.noremap(
-- "n",
-- 	"<leader>dbm",
-- 	function() require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
-- 	"dap_set_breakpoint",
-- 	"Set breakpoint"
-- )
--

-- local dap_ui_variables = require "dap.ui.variables"
--
-- r.noremap("n", "<leader>dvc", dap_ui_variables.scopes, "dap", "dap_scopes", "Variables scopes")
-- r.noremap(
--   "n",
-- 	"<leader>dvh",
-- 	dap_ui_variables.hover,
-- 	"dap_variables_hover",
-- 	"Variables hover"
-- )
-- r.noremap(
--   "v",
-- 	"<leader>dvv",
-- 	dap.visual_hover,
-- 	"dap_visual_hover",
-- 	"Visual hover"
-- )

-- local dap_ui_widgets = require "dap.ui.widgets"
-- r.noremap("n", "<leader>dwh", dap_ui_widgets.hover, "dap", "dap_widgets_hover", "Widgets hover")
-- r.noremap(
--   "n",
-- 	"<leader>dwf",
-- 	function() require'dap.ui.widgets';widgets.centered_float(widgets.scopes) end,
-- 	"dap_widgets_scopes",
-- 	"Widgets scopes"
-- )

-- r.noremap("n", "<leader>dro", dap.repl.open, "repl_open", "Open REPL")
-- r.noremap("n", "<leader>drl", dap.repl.run_last, "repl_run_last", "REPL last")

r.noremap("n", "<leader>dl", function()
  print(vim.fn.stdpath("cache") .. "/dap.log")
end, "Show log path")

local telescope = require("telescope")

r.noremap("n", "<leader>/dcc", telescope.extensions.dap.commands, "DAP commands")
r.noremap("n", "<leader>/dco", telescope.extensions.dap.configurations, "DAP configurations")
r.noremap("n", "<leader>/db", telescope.extensions.dap.list_breakpoints, "DAP list breakpoints")
r.noremap("n", "<leader>/dv", telescope.extensions.dap.variables, "DAP variables")
r.noremap("n", "<leader>/df", telescope.extensions.dap.frames, "DAP frames")
