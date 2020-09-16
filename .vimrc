set number
set relativenumber
set autoindent
set tabstop=4
set mouse=
set ttymouse=

" FIX: ssh from wsl starting with REPLACE mode
" https://stackoverflow.com/a/11940894
if $TERM =~ 'xterm-256color'
  set noek
endif
