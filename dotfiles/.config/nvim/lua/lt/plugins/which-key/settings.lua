local wk = require("which-key")

 wk.register({
 ["<leader>"] = {
    g = { name = 'git' },
    t = { name = 'types' },
    b = { name = 'buffers' },
    p = { name = 'projects' },
    f = { name = 'fixes' },
    s = { name = 'sessions' },
    m = { name = 'marks' },
    w = { name = 'windows' },
    r = {
      name = 'refactor',
      l = { name  = 'line' },
      p = { name  = 'parameter' }
    },
  },
})
