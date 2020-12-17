local prettier_standard = {
    command = 'prettier-standard',
    args = { '--stdin' },
    rootPatterns = {
        'package.json',
        '.prettierignore',
    },
}

return prettier_standard
