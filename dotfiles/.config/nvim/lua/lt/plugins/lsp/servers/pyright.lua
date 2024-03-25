return function(on_attach)
  return {
    on_attach = on_attach,
    -- settings = {
    --   pyright = {
    --     -- Using Ruff's import organizer
    --     disableOrganizeImports = true,
    --   },
    --   python = {
    --     analysis = {
    --       -- Ignore all files for analysis to exclusively use Ruff for linting
    --       ignore = { "*" },
    --     },
    --   },
    -- },
  }
end
