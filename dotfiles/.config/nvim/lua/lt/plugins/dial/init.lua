return {
  "monaqa/dial.nvim",
  init = function()
    local dial_config = require("dial.config")

    local augend = require("dial.augend")

    dial_config.augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.integer.alias.octal,
        augend.integer.alias.binary,
        augend.hexcolor.new({}),
        augend.semver.alias.semver,
        augend.date.alias["%H:%M:%S"],
        augend.constant.new({
          elements = { "true", "false" },
          word = true,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "True", "False" },
          word = true,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "and", "or" },
          word = true,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "&&", "||" },
          word = false,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { ">", "<" },
          word = false,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "==", "!=" },
          word = false,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "===", "!==" },
          word = false,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { ">=", "<=" },
          word = false,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "+=", "-=", "*=", "/=", "//=", "%=" },
          word = false,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "++", "--" },
          word = false,
          cyclic = true,
        }),
      },
    })
  end,
  keys = {
    { "<C-a>",  function() require("dial.map").inc_normal() end,  noremap = true },
    { "<C-x>",  function() require("dial.map").dec_normal() end,  noremap = true },
    { "g<C-a>", function() require("dial.map").inc_gnormal() end, noremap = true },
    { "g<C-x>", function() require("dial.map").dec_gnormal() end, noremap = true },
    {
      "<C-a>",
      function() require("dial.map").inc_visual() end,
      noremap = true,
      mode = 'v'
    },
    {
      "<C-x>",
      function() require("dial.map").dec_visual() end,
      noremap = true,
      mode = 'v'
    },
    {
      "g<C-a>",
      function() require("dial.map").inc_gvisual() end,
      noremap = true,
      mode = 'v'
    },
    {
      "g<C-x>",
      function() require("dial.map").dec_gvisual() end,
      noremap = true,
      mode = 'v'
    },
  }
}
