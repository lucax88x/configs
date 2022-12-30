return {
  "monaqa/dial.nvim",
  init = function()
    local r = require("lt.utils.remaps")

    r.noremap("n", "<C-a>", function()
      require("dial.map").inc_normal()
    end, "Dial increment normal")
    r.noremap("n", "<C-x>", function()
      require("dial.map").dec_normal()
    end, "Dial decrement normal")
    r.noremap("v", "<C-a>", function()
      require("dial.map").inc_visual()
    end, "Dial increment visual")
    r.noremap("v", "<C-x>", function()
      require("dial.map").dec_visual()
    end, "Dial decrement visual")

    r.noremap("v", "g<C-a>", function()
      require("dial.map").inc_gvisual()
    end, "Dial increment global visual")
    r.noremap("v", "g<C-x>", function()
      require("dial.map").dec_gvisual()
    end, "Dial decrement global visual")
  end,
  config = function()
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
  keys = { "<C-a>", "<C-x>" },
}
