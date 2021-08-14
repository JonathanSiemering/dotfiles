local va = require('utils.vars')
local fn = require('utils.fn')

local repo = 'https://github.com/wbthomason/packer.nvim'

local packer = require('packer')

packer.init({
    profile = {
        enable = true
    }
})

packer.startup(function(use)

    use {'wbthomason/packer.nvim'}

    use {
        'akinsho/nvim-bufferline.lua',
        config = function() require('plugins.bufferline') end
    }

    use {
        'gruvbox-community/gruvbox',
        config = function() require('plugins.gruvbox') end
    }

    use {'tpope/vim-fugitive'}

    use {'tpope/vim-commentary'}

    use {'tpope/vim-endwise'}

    use {'JonathanSiemering/vim-closer'}

    use {'vim-airline/vim-airline'}

    use {'mbbill/undotree'}

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            {'kyazdani42/nvim-web-devicons'}
        },
        config = function() require('plugins.nvimtree') end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'}
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = {'TSUpdate'},
        config = function() require('plugins.treesitter') end
    }

    use {
        'glepnir/lspsaga.nvim',
        requires = {
            {'neovim/nvim-lspconfig'}
        },
        config = function() require('plugins.lspsaga') end
    }

    use {
        'hrsh7th/nvim-compe',
        requires = {
            {'neovim/nvim-lspconfig'},
            {'ray-x/lsp_signature.nvim'}
        },
        config = function() require('plugins.completion') end
    }

    use {
        'folke/which-key.nvim',
        config = function() require('plugins.whichkey') end
    }

end)
