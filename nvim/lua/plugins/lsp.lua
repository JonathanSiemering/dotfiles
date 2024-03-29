return {

    -- LSP config
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {'neovim/nvim-lspconfig'},
        config = function()
            local mason = require('mason')
            local mason_lspconfig = require('mason-lspconfig')
            local vars = require('utils.vars')

            -- Change sign colum icons
            local signs = { Error = " " .. vars.lspErrorIcon, Warn = " " .. vars.lspWarningIcon, Hint = " " .. vars.lspHintIcon, Info = " " .. vars.lspInfoIcon }

            for type, icon in pairs(signs) do
              local hl = "DiagnosticSign" .. type
              vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            mason_lspconfig.setup()
            mason_lspconfig.setup_handlers {

                -- default
                function (server_name)
                    require('lspconfig')[server_name].setup {}
                end,

                -- overrides
                ['lua_ls'] = function() require('lsp.lua-ls') end,
                ['eslint'] = function() require('lsp.eslint') end,
                ['omnisharp'] = function() require('lsp.omnisharp') end
            }
        end
    },

    -- Snippets
    {
        'L3MON4D3/LuaSnip',
        dependencies = {'rafamadriz/friendly-snippets'},
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        version = false, -- last release is way too old
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local o = vim.o
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            o.completeopt = "menuone,noselect"

            cmp.setup{
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'calc' },
                    { name = 'luasnip' }
                },
                mapping = cmp.mapping.preset.insert({
                    ['<TAB>'] = cmp.mapping.confirm({ select = true }),
                }),
            }
        end
    },

    -- Signature
    {
        'ray-x/lsp_signature.nvim',
        config = function()
            require('lsp_signature').setup({
                bind = true,
                floating_window = true,
                extra_trigger_chars = {"(",","},
            })
        end
    },

    -- Symbols Outline
    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require('symbols-outline').setup({
                highlight_hovered_item = true,
                show_guides = false,
                auto_preview = false,
                position = 'right',
                width = 25,
                show_numbers = true,
                show_relative_numbers = true,
                show_symbol_details = false,
            })
        end
    },

}
