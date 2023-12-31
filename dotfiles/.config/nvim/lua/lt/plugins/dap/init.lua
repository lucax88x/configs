return {
  "mfussenegger/nvim-dap",
  init = function()
    -- dap.set_log_level("TRACE")

    local r = require("lt.utils.remaps")

    r.which_key("<leader>dv", "variables")
    r.which_key("<leader>dw", "widgets")
    r.which_key("<leader>dr", "repl")
    r.which_key("<leader>/d", "dap")

    r.noremap("n", "<F5>", function()
      local dap = require("dap")
      dap.continue()
    end, "Debugger start/continue (F5)")
    r.noremap("n", "<leader>dd", function()
      local dap = require("dap")
      dap.continue()
    end, "Debugger start/continue")

    r.noremap("n", "<leader>do", function()
      local dap = require("dap")
      dap.step_over()
    end, "Step over (f8)")
    r.noremap("n", "<F8>", function()
      local dap = require("dap")
      dap.step_over()
    end, "Step over")

    r.noremap("n", "<leader>di", function()
      local dap = require("dap")
      dap.step_into()
    end, "Step into (f7)")
    r.noremap("n", "<F7>", function()
      local dap = require("dap")
      dap.step_into()
    end, "Step into")

    r.noremap("n", "<leader>dO", function()
      local dap = require("dap")
      dap.step_out()
    end, "Step out")

    r.noremap("n", "<leader>db", function()
      local dap = require("dap")
      dap.toggle_breakpoint()
    end, "Toggle breakpoint")

    r.noremap({ "n", "v" }, "<Leader>dh", function()
      require("dap.ui.widgets").hover()
    end, "hover widgets")

    -- r.noremap("n", "<leader>dbc", function()
    --   local dap = require("dap")
    --   dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    -- end, "Set breakpoint")
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

    r.noremap("n", "<leader>/dcc", function()
      require("fzf-lua").dap_commands()
    end, "DAP commands")
    r.noremap("n", "<leader>/dco", function()
      require("fzf-lua").dap_configurations()
    end, "DAP configurations")
    r.noremap("n", "<leader>/db", function()
      require("fzf-lua").dap_breakpoints()
    end, "DAP list breakpoints")
    r.noremap("n", "<leader>/dv", function()
      require("fzf-lua").dap_variables()
    end, "DAP variables")
    r.noremap("n", "<leader>/df", function()
      require("fzf-lua").dap_frames()
    end, "DAP frames")
  end,
}
