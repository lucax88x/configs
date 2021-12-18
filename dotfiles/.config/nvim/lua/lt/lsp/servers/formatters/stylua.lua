-- paru -S stylua
return {
	formatCommand = "stylua -s --indent-width 2 --quote-style 'AutoPreferSingle' --stdin-filepath ${INPUT} -",
	formatStdin = true,
}
