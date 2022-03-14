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
    set autoread
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
    ino emap ? ?<c-g>u
]])

-- Move text
vim.cmd([[
    nnoremap <c-n> :m .+1<cr>==
    nnoremap <c-e> :m .-2<cr>==
    inoremap <c-n> <esc>:m .+1<cr>==i
    inoremap <c-e> <esc>:m .-2<cr>==i
    vnoremap <c-n> :m '>+1<cr>gv=gv
    vnoremap <c-e> :m '<-2<cr>gv=gv
]])

-- Menu
vim.cmd([[
    nnoremap <F2> <cmd>NvimTreeToggle<CR>
    nnoremap <F3> <cmd>UndotreeToggle<CR>
    nnoremap <F4> <cmd>SymbolsOutline<CR>
]])

-- Debug
vim.cmd([[
    nnoremap <F5> <cmd>lua require("dapui").open() require('dap').continue()<CR>
    nnoremap <F6> <cmd>lua require('dap').step_over()<CR>
    nnoremap <F7> <cmd>lua require('dap').step_into()<CR>
    nnoremap <F8> <cmd>lua require('dap').close() require('dapui').close()<CR>
    nnoremap <F9> <cmd>lua require('dap').toggle_breakpoint()<CR>
]])

-- Buffer
vim.cmd([[
    nnoremap <silent><leader>1 <cmd>BufferLineGoToBuffer 1<CR>
    nnoremap <silent><leader>2 <cmd>BufferLineGoToBuffer 2<CR>
    nnoremap <silent><leader>3 <cmd>BufferLineGoToBuffer 3<CR>
    nnoremap <silent><leader>4 <cmd>BufferLineGoToBuffer 4<CR>
    nnoremap <silent><leader>5 <cmd>BufferLineGoToBuffer 5<CR>
    nnoremap <silent><leader>6 <cmd>BufferLineGoToBuffer 6<CR>
    nnoremap <silent><leader>7 <cmd>BufferLineGoToBuffer 7<CR>
    nnoremap <silent><leader>8 <cmd>BufferLineGoToBuffer 8<CR>
    nnoremap <silent><leader>9 <cmd>BufferLineGoToBuffer 9<CR>
]])
