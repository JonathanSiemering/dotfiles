set number
set relativenumber
set autoindent
set tabstop=4
set mouse=
set ttymouse=
set belloff=all

" Colemak
nnoremap n j| vnoremap n j
nnoremap e k| vnoremap e k
nnoremap i l| vnoremap i l

nnoremap N J| vnoremap N J
nnoremap E K| vnoremap E K
nnoremap I L| vnoremap I L

nnoremap j n| vnoremap j n
nnoremap k e| vnoremap k e
nnoremap l i| vnoremap l i

nnoremap J N| vnoremap J N
nnoremap K E| vnoremap K E
nnoremap L I| vnoremap L I

" FIX: ssh from wsl starting with REPLACE mode
" https://stackoverflow.com/a/11940894
if $TERM =~ 'xterm-256color'
  set noek
endif
