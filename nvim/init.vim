call plug#begin('~/.vim/plugged')
Plug 'bling/vim-bufferline'
Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
call plug#end()

lua require('nvim-autopairs').setup()
lua require'nvim-treesitter.configs'.setup{ 
        \   highlight = { 
        \       enable = true 
        \   },
        \   autopairs = {
        \       enable = true
        \   }
        \ }

set termguicolors
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

let g:nvim_tree_width = 30
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_lsp_diagnostics = 1

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.preselect = 'disable'
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true

colorscheme gruvbox
highlight clear SignColumn

nnoremap <F2> :NvimTreeToggle<CR>
nnoremap <F3> :UndotreeToggle<CR>

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
