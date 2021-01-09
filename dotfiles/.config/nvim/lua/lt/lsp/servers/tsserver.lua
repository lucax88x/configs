return function(language_server_path, on_attach)
    local bin_path = language_server_path .. "/typescript-language-server/typescript-language-server"
    return {
        cmd = {bin_path, "--stdio"},
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)

            -- tsserver, stop messing with prettier da fuck!
            -- client.resolved_capabilities.document_formatting = false
        end
    }
end
