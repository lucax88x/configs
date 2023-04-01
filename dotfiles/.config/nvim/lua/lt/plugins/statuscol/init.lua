return {
  "luukvbaal/statuscol.nvim",
  config = function()
    -- require("statuscol").setup({
    --   setopt = true,
    -- })
    --
    local builtin = require("statuscol.builtin")

    require("statuscol").setup({
      relculright = true,
      segments = {
        {
          sign = { name = { "Diagnostic" }, maxwidth = 2 },
          click = "v:lua.ScSa"
        },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        {
          sign = { name = { ".*" }, maxwidth = 1, colwidth = 1 },
          click = "v:lua.ScSa"
        },
      }
    })
  end,
}
