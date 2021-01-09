return function(language_server_path)
    local bin_path = language_server_path .. "/json-languageserver/vscode-json-languageserver"
    return {
        cmd = {bin_path, "--stdio"},
    }
end
