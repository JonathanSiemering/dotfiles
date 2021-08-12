call plug#begin('~/.vim/plugged')
Plug 'akinsho/nvim-bufferline.lua'
Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
call plug#end()

lua require('bufferline').setup{}
lua require('nvim-autopairs').setup{}
lua require('nvim-treesitter.configs').setup{ 
        \   highlight = { 
        \       enable = true 
        \   },
        \   autopairs = {
        \       enable = true
        \   }
        \ }
lua require('lspsaga').init_lsp_saga{
        \   code_action_keys = {
        \       quit = '<esc>', exec = '<cr>'
        \   },
        \   rename_action_keys = {
        \       quit = '<esc>', exec = '<cr>'
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

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_menu_length = 1
let g:completion_trigger_on_delete = 1

let g:nvim_tree_width = 30
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_lsp_diagnostics = 1

colorscheme gruvbox
highlight clear SignColumn

nnoremap <F2> <cmd>NvimTreeToggle<CR>
nnoremap <F3> <cmd>UndotreeToggle<CR>

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
nnoremap <leader>da <cmd>lua require('lspsaga.codeaction').code_action()<cr>
nnoremap <leader>dA <cmd>lua require('lspsaga.codeaction').range_code_action()<cr>
nnoremap <leader>dd <cmd>lua require('lspsaga.hover').render_hover_doc()<cr>
nnoremap <leader>dD <cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>
nnoremap <leader>dr <cmd>lua require('lspsaga.rename').rename()<cr>
nnoremap <leader>ds <cmd>lua require('lspsaga.provider').preview_definition()<cr>

nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gs <cmd>G<cr>
nnoremap <leader>gc <cmd>Git commit<cr>
nnoremap <leader>gp <cmd>Git push<cr>
nnoremap <leader>go <cmd>Git pull<cr>
nnoremap <leader>gj <cmd>diffget //3<cr>
nnoremap <leader>gf <cmd>diffget //2<cr>

nnoremap <leader>t <cmd>lua require('lspsaga.floaterm').open_float_terminal()<cr>
