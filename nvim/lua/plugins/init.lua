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

    use {'wbthomason/packer.nvim'}

    use {
        'akinsho/nvim-bufferline.lua',
        config = function() require('plugins.bufferline') end
    }

    use {
        'gruvbox-community/gruvbox',
        config = function() require('plugins.gruvbox') end
    }

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
            {'nvim-lua/popup.nvim'},
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
        config = function() require('plugins.lsp') end
    }

    use {
        'simrat39/symbols-outline.nvim',
        requires = {
            {'neovim/nvim-lspconfig'}
        },
        config = function() require('plugins.symbolsoutline') end
    }

    use {
        'rcarriga/nvim-dap-ui',
        requires = {
            {'mfussenegger/nvim-dap'},
            {'theHamsta/nvim-dap-virtual-text'},
            {'nvim-telescope/telescope-dap.nvim'}
        },
        config = function() require('plugins.dap') end
    }

    use {'vim-airline/vim-airline'}

    use {'tpope/vim-fugitive'}

    use {'tpope/vim-commentary'}

    use {'tpope/vim-endwise'}

    use {'JonathanSiemering/vim-closer'}

    use {'mbbill/undotree'}

    use {'RRethy/vim-illuminate'}

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'}
        },
        config = function() require('plugins.gitsigns') end
    }

    use {
        'folke/which-key.nvim',
        config = function() require('plugins.whichkey') end
    }

end)

-- Auto sync packages
if (fn.isUpdate(true)) then
    fn.execute('cd ' .. path .. ' && git pull')
    packer.sync()
end
