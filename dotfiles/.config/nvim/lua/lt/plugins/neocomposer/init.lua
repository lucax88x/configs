return {
  "ecthelionvi/NeoComposer.nvim",
  dependencies = { "kkharji/sqlite.lua" },
  opts = {},
  keys = {
    { "<leader>md", "<cmd>ToggleDelay<cr>", desc = "Macro delays" },
    { "<leader>me", "<cmd>EditMacros<cr>", desc = "Edit Macros" },
  },
-- play_macro	Q	Plays queued macro
-- stop_macro	cq	Halts macro playback
-- toggle_macro_menu	<m-q>	Toggles popup macro menu
-- cycle_next	<c-n>	Cycles available macros forward
-- cycle_prev	<c-p>	Cycles available macros backward
-- toggle_record	q	Starts recording, press again to end recording
-- yank_macro	yq	Yank the currently selected macro, in human readable format into the default register
}
