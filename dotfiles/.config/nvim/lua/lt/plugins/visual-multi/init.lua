return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ["Find Under"] = ""
    }
  end,
  keys = {
    -- todo
    { "<leader>sw", '<Plug>(VM-Find-Under)', desc = "Multi cursor (wip)" },
  }
}
