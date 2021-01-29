-- vim.g.completion_confirm_key = "<CR>"
-- vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
-- vim.g.completion_enable_snippet = 'snippets.nvim'

-- -- vim.g.completion_trigger_keyword_length = 3
-- -- -- vim.g.completion_enable_auto_popup = 0

-- vim.g.completion_trigger_keyword_length = 3
-- vim.g.completion_enable_auto_popup = 0

-- -- let g:completion_chain_complete_list = {
-- --     \'default' : [
-- --     \    {'complete_items': ['lsp']},
-- --     \    {'complete_items': ['snippet']},
-- --     \    {'mode': '<c-p>'},
-- --     \    {'mode': '<c-n>'}
-- --     \]
-- --     \}
-- vim.g.completion_chain_complete_list = {

--   default = {
--     default = {
--       {
--         complete_items = {
--            "lsp", "snippet"
--         }
--       },
--       {
--         complete_items = {
--            "ts", "path", "buffers"
--         }
--       }
--     },

--     string = {
--       {
--         complete_items = {
--           "path", "buffers"
--         }
--       }
--     }
--   }
-- }

require'compe'.setup {
  enabled = true;
  debug = false;
  min_length = 3;
  -- preselect = 'enable' || 'disable' || 'always';
  -- throttle_time = ... number ...;
  -- source_timeout = ... number ...;
  -- incomplete_delay = ... number ...;
  -- allow_prefix_unmatch = false;

  source = {
    path = true;
    buffer = true;
    vsnip = true;
    nvim_lsp = true;
  };
}
