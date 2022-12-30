return {
  "ggandor/leap.nvim",
  dependencies = "ggandor/flit.nvim",
  config = function()
    local leap = require("leap")
    local flit = require("flit")

    leap.add_default_mappings()
    flit.setup()
  end,
}
