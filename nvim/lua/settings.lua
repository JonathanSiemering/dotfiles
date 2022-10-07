vim.cmd([[
    set termguicolors
    set mouse=
    set number
    set relativenumber
    set nohlsearch
    set noerrorbells
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set scrolloff=8
    set incsearch
    set nohidden
    set noswapfile
    set nobackup
    set undodir=~/.vim/undodir
    set undofile
    set autoread
    set autowrite
    set autowriteall
    set signcolumn=yes
    set laststatus=3
    set fillchars+=vert:\|
]])

-- Highlight yanked
vim.cmd([[
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank({higroup="@text.literal.markdown_inline", timeout=600})
    augroup END
]])

