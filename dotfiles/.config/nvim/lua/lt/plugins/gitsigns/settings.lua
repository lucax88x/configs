require('gitsigns').setup {
  signs = {
    add          = {hl = 'GruvboxGreen' , text = '│', numhl='GitSignsAddNr'},
    change       = {hl = 'GruvboxAqua', text = '│', numhl='GitSignsChangeNr'},
    delete       = {hl = 'GruvboxRed', text = '_', numhl='GitSignsDeleteNr'},
    topdelete    = {hl = 'GruvboxRed', text = '‾', numhl='GitSignsDeleteNr'},
    changedelete = {hl = 'GruvboxAqua', text = '~', numhl='GitSignsChangeNr'},
  },
  numhl = false,
  watch_gitdir = {
    interval = 1000
  },
  sign_priority = 9,
  status_formatter = nil, -- Use default
}
