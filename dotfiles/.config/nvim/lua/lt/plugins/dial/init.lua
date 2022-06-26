local present, dial_config = pcall(require, "dial.config")
if not present then
  return
end

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

local map = require("dial.map")

local r = require("lt.utils.remaps")

r.noremap("n", "<C-a>", map.inc_normal(), "Dial increment normal")
r.noremap("n", "<C-x>", map.dec_normal(), "Dial decrement normal")
r.noremap("v", "<C-a>", map.inc_visual(), "Dial increment visual")
r.noremap("v", "<C-x>", map.dec_visual(), "Dial decrement visual")
r.noremap("v", "g<C-a>", map.inc_gvisual(), "Dial increment global visual")
r.noremap("v", "g<C-x>", map.dec_gvisual(), "Dial decrement global visual")
