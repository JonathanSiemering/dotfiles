return {

    -- Notify
    {
        'rcarriga/nvim-notify',
        config = function()
            local notify = require('notify')
            local telescope = require('telescope')

            notify.setup({})
            vim.notify = notify
            telescope.load_extension('notify')
        end
    },

    -- Lsp notify
    {
        'mrded/nvim-lsp-notify',
        dependencies = {
            'rcarriga/nvim-notify',
            'neovim/nvim-lspconfig',
        },
        config = function()
            require('lsp-notify').setup({})
        end
    },

}

