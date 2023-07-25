return {
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
        },
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
                function (server_name) 
                    require("lspconfig")[server_name].setup()
                end,
                ['lua_ls'] = function()
                    require("lspconfig")['lua_ls'].setup {
                        settings = {
                            Lua = {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                    version = 'LuaJIT',
                                },
                                diagnostics = {
                                    -- Get the language server to recognize the `vim` global
                                    globals = {'vim'},
                                },
                                workspace = {
                                    -- Make the server aware of Neovim runtime files
                                    library = vim.api.nvim_get_runtime_file("", true),
                                },
                                -- Do not send telemetry data containing a randomized but unique identifier
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    }
                end
            }
        end
    },

    {
        'L3MON4D3/LuaSnip',
        dependencies = {'rafamadriz/friendly-snippets'},
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },

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
