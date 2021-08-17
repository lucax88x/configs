-- gS to split a one-liner into multiple lines
-- gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
nnoremap('<leader>rls', '<cmd>SplitjoinSplit<cr>', 'refactoring', 'refactoring_split_function_to_multiple', 'to split a one-liner into multiple lines')
nnoremap('<leader>rlj', '<cmd>SplitjoinJoin<cr>', 'refactoring', 'refactoring_join_function_to_single', '(with the cursor on the first line of a block) to join a block into a single-line statement.')
