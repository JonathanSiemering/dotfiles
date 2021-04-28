call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
call plug#end()

lua require'nvim-treesitter.configs'.setup{ 
        \   highlight = { 
        \       enable = true 
        \   }
        \ }

set relativenumber
set nohlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nu
set incsearch
set scrolloff=8
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set signcolumn=yes
set completeopt=menuone,noinsert,noselect

let mapleader=' '
let g:gruvbox_contrast_dark = 'hard'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_menu_length = 1

colorscheme gruvbox

nnoremap gb <cmd>bn<cr>
nnoremap gB <cmd>bp<cr>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fF <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').lsp_definitions()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>

nnoremap <leader>df <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>
nnoremap <leader>dw <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>
nnoremap <leader>da <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>
nnoremap <leader>dA <cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>

nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gs <cmd>G<cr>
nnoremap <leader>gc <cmd>Git commit<cr>
nnoremap <leader>gp <cmd>Git push<cr>
nnoremap <leader>go <cmd>Git pull<cr>
nnoremap <leader>gj <cmd>diffget //3<cr>
nnoremap <leader>gf <cmd>diffget //2<cr>
