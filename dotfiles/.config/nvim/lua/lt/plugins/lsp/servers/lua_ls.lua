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
        hint = {
          enable = true,
        },
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file("lua", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = { enable = false },
      },
    },
  }
end
