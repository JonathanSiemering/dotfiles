return {

    -- Dap
    {
        'mfussenegger/nvim-dap',
        config = function()
            require('dap')

            vim.fn.sign_define('DapBreakpoint', {text = '', texthl = 'DapBreakpoint', linehl = '', numhl = ''})
            vim.fn.sign_define('DapLogPoint', {text = '', texthl = 'DapLogPoint', linehl = '', numhl = ''})
            vim.fn.sign_define('DapStopped', {text = '', texthl = 'DapStopped', linehl = 'DapStoppedLineHl', numhl = ''})
            vim.fn.sign_define('DapBreakpointRejected', {text = '', texthl = 'DapBreakpointRejected', linehl = '', numhl = ''})

            -- Load languages
            require('dap.go')
            require('dap.csharp')
        end
    },

    -- Dap UI
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        config = function()
            require('dapui').setup({
                layouts = {
                    {
                        position = "right",
                        size = 60,
                        elements = {
                            "scopes",
                            {id = "stacks", size = 0.15},
                            {id = "breakpoints", size = 0.15},
                            {id = "watches", size = 0.15},
                        },
                    },
                    {
                        position = "bottom",
                        size = 0.2,
                        elements = {
                            "repl",
                            {id = "console", size = 0.20},
                        },
                    },
                },
                controls = {
                    enable = false,
                },
            })
        end
    },

    -- DAP virtual text
    {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = {'mfussenegger/nvim-dap'},
        config = function()
            require('nvim-dap-virtual-text').setup({
                enabled = true,
            })
        end
    },

    -- Telescope DAP
    {
        'nvim-telescope/telescope-dap.nvim',
        dependencies = {
            'mfussenegger/nvim-dap',
            'telescope.nvim',
        },
        config = function()
            require('telescope').load_extension('dap')
        end
    },

}
