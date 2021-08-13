vim.cmd([[
    set termguicolors
    set number
    set relativenumber
    set nohlsearch
    set noerrorbells
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set scrolloff=8
    set incsearch
    set hidden
    set noswapfile
    set nobackup
    set undodir=~/.vim/undodir
    set undofile
    set signcolumn=yes
    set completeopt=menuone,noinsert,noselect
]])

-- Change Y to copy to end
vim.cmd([[
    nnoremap Y y$
]])

-- Undo break points
vim.cmd([[
    inoremap , ,<c-g>u
    inoremap . .<c-g>u
    inoremap ! !<c-g>u
    inoremap ? ?<c-g>u
]])

-- Move text
vim.cmd([[
    nnoremap <c-j> :m .+1<cr>==
    nnoremap <c-k> :m .-2<cr>==
    inoremap <c-j> <esc>:m .+1<cr>==i
    inoremap <c-k> <esc>:m .-2<cr>==i
    vnoremap <c-j> :m '>+1<cr>gv=gv
    vnoremap <c-k> :m '<-2<cr>gv=gv
]])

-- Menu
vim.cmd([[
    nnoremap <F2> <cmd>NvimTreeToggle<CR>
    nnoremap <F3> <cmd>UndotreeToggle<CR>
]])
--
-- Movement
vim.cmd([[
    nnoremap gb <cmd>bn<cr>
    nnoremap gB <cmd>bp<cr>
]])
