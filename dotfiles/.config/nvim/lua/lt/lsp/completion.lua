vim.g.completion_confirm_key = "<CR>"
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_enable_snippet = 'snippets.nvim'
-- vim.g.completion_trigger_keyword_length = 2
vim.g.completion_enable_auto_popup = 0
vim.g.completion_chain_complete_list = {

  default = {
    default = {
      {
        complete_items = {
          "lsp", "snippet", "ts", "path", "buffers"
        }
      }
    },

    string = {
      {
        complete_items = {
          "path", "buffers"
        }
      }
    }
  }
}

