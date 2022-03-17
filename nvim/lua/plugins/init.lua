-- Install packer
local va = require('utils.vars')
local fn = require('utils.fn')

local repo = 'https://github.com/wbthomason/packer.nvim'
local path = va.dataPath .. '/site/pack/packer/start/packer.nvim'

if not fn.exists(path) then
    fn.execute('git clone ' .. repo .. ' ' .. path)
    vim.cmd('packadd packer.nvim')
end

-- Init packer
local packer = require('packer')

packer.init({
    profile = {
        enable = true
    }
})

packer.startup(function(use)

    -- Packer itself
    use {'wbthomason/packer.nvim'}

    -- Filetypes
    use ('nathom/filetype.nvim')

    -- Gruvbox colorscheme
    use {
        'gruvbox-community/gruvbox',
        config = function() require('plugins.gruvbox') end
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('plugins.treesitter') end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'}
        }
    }

    -- LSP --
    use {
        'neovim/nvim-lspconfig',
        config = function() require('plugins.lsp') end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-calc'},
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'}
        },
        after = 'nvim-lspconfig',
        config = function() require('plugins.nvimcomp') end
    }

    use {
        'ray-x/lsp_signature.nvim',
        after = 'nvim-lspconfig',
        config = function() require('plugins.lspsignature') end
    }

    use {
        'simrat39/symbols-outline.nvim',
        after = 'nvim-lspconfig',
        config = function() require('plugins.symbolsoutline') end
    }
    -- --

    -- DAP --
    use {
        'mfussenegger/nvim-dap',
        config = function() require('plugins.dap') end
    }

    use {
        'rcarriga/nvim-dap-ui',
        after = 'nvim-dap',
        config = function() require('plugins.dapui') end
    }

    use {
        'theHamsta/nvim-dap-virtual-text',
        after = 'nvim-dap',
        config = function() require('plugins.dapvirtualtext') end
    }

    use {
        'nvim-telescope/telescope-dap.nvim',
        after = {
            'nvim-dap',
            'telescope.nvim'
        },
        config = function() require('plugins.telescopedap') end
    }
    -- --

    -- Info lines --
    use {
        'akinsho/nvim-bufferline.lua',
        config = function() require('plugins.bufferline') end
    }

    use {
        'glepnir/galaxyline.nvim',
        requires = {
            {'kyazdani42/nvim-web-devicons'}
        },
        config = function() require('plugins.galaxyline') end
    }
    -- --

    -- Git --
    use {'tpope/vim-fugitive'}

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'}
        },
        config = function() require('plugins.gitsigns') end
    }
    -- --

    -- Undo tree
    use {'mbbill/undotree'}

    -- File tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            {'kyazdani42/nvim-web-devicons'}
        },
        config = function() require('plugins.nvimtree') end
    }

    -- Variable illuminate
    use {'RRethy/vim-illuminate'}

    -- Comment helper
    use {'tpope/vim-commentary'}

    -- Autopair --
    use {'tpope/vim-endwise'}

    use {'JonathanSiemering/vim-closer'}
    -- --

    -- Whichkey
    use {
        'folke/which-key.nvim',
        config = function() require('plugins.whichkey') end
    }

end)

-- Auto sync packages when file update exists
if (fn.isUpdate(true)) then
    fn.execute('cd ' .. path .. ' && git pull')
    packer.sync()
end
