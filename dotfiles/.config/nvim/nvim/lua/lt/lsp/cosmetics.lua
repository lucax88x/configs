-- highlight link LspDiagnosticsError User8
-- sign define LspDiagnosticsErrorSign text=
-- sign define LspDiagnosticsWarningSign text=
-- sign define LspDiagnosticsInformationSign text=כֿ
-- sign define LspDiagnosticsHintSign text=➤

-- vim.api.nvim_call_function("sign_define", {"LspDiagnosticsErrorSign",
--     {text = "", texthl = "LspDiagnosticsError"}})

vim.api.nvim_call_function("sign_define", {"LspDiagnosticsErrorSign",
    {text = "", texthl = "LspDiagnosticsError"}})
vim.fn.sign_define("LspDiagnosticsErrorSign",
    {text = "", texthl = "LspDiagnosticsError"})
--
vim.cmd [[ sign define LspDiagnosticsErrorSign text= texthl=LspDiagnosticsError linehl= numhl= ]]
-- vim.cmd [[ sign define LspDiagnosticsErrorSign text= ]]
--
--
-- indicator_errors = '',
-- indicator_warnings = '',
-- indicator_info = '🛈',
-- indicator_hint = '!',
-- indicator_ok = '',
