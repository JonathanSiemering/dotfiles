 return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            flavor = 'mocha',
            term_colors = true,
            styles = {
                comments = {},
                conditionals = {},
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
            },
            color_overrides = {
                mocha = {
                    base = '#101010',
                    mantle = '#181818',
                    crust = '#202020',
                },
            },
            custom_highlights = {
                Yanked = {
                    bg = '#1c3f47',
                    fg = '#9e9e9e',
                },

                GalaxylineAqua = { fg = '#427b58' },
                GalaxylineBlue = { fg = '#83a598' },
                GalaxylineYellow = { fg = '#fabd2f' },
                GalaxylineRed = { fg = '#cc241d' },
                GalaxylineGreen = { fg = '#98971a' },
            },
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = true,
                harpoon = true,
                mason = true,
                which_key = true,
            },
        })

        vim.cmd.colorscheme "catppuccin"
    end
}

