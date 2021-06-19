-- npm install -g vls
return function(language_server_path, on_attach)
    local bin_path = language_server_path .. "/vls/vls"
    return {
        cmd = {bin_path, "--stdio" },
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
        end
    }
end
