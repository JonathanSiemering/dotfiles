return {
    'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local harpoon = require('harpoon')
        local telescope = require('telescope')

        harpoon.setup()
        telescope.load_extension('harpoon')
    end
}
