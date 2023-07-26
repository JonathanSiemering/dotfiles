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

                function (server_name)
                    require('lspconfig')[server_name].setup {}
                end,

                ['lua_ls'] = function()
                    require('lspconfig')['lua_ls'].setup {
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
                end,

                ['eslint'] = function()
                    require('lspconfig')['eslint'].setup {
                        filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue', 'svelte', 'astro', 'html' }
                    }
                end,

                ['omnisharp'] = function()
                    local lspconfig = require('lspconfig')
                    lspconfig['omnisharp'].setup {
                        enable_editorconfig_support = true,
                        enable_roslyn_analyzers = true,
                        enable_import_completion = true,
                        root_dir = lspconfig.util.root_pattern('*.sln') or lspconfig.util.root_pattern('*.csproj')
                    }
                end

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
