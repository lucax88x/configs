local vim = vim
local api = vim.api

return function(on_attach)
  return {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
    end,

    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim", "hs", "spoon" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.tbl_extend(
            "keep",
            api.nvim_get_runtime_file("", true),
            { "~/.hammerspoon/Spoons/EmmyLua.spoon/annotations" }
          ),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = { enable = false },
      },
    },
  }
end
