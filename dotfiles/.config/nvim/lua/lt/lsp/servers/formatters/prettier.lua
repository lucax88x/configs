-- local prettier = {
--     sourceName = 'prettier',
--     command = './node_modules/.bin/prettier',
--     debounce = 100,
--     args = { '--stdin', '--stdin-filepath', '%filepath' },
--     rootPatterns = {
--         '.prettierrc',
--         '.prettierrc.json',
--         '.prettierrc.toml',
--         '.prettierrc.json',
--         '.prettierrc.yml',
--         '.prettierrc.yaml',
--         '.prettierrc.json5',
--         '.prettierrc.js',
--         '.prettierrc.cjs',
--         'prettier.config.js',
--         'prettier.config.cjs',
--     },
-- }

local prettier  = {
  formatCommand = "./node_modules/.bin/prettier --stdin --stdin-filepath ${INPUT}",
  formatStdin = true
}

return prettier
