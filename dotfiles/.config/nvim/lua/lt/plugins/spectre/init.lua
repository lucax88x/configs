return {
  "windwp/nvim-spectre",
  init = function()
    local r = require("lt.utils.remaps")

    r.noremap("n", "<leader>sR", function()
      require("spectre").open()
    end, "Search by regex in all files")

    --[[ "search current word ]]
    --[[ nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR> ]]
    --[[ vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR> ]]
    --[[ "  search in current file ]]
    --[[ nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr> ]]
    --[[ " run command :Spectre ]]
  end,
  config = function()
    require("spectre").setup()
  end,
  event = "VeryLazy",
}
