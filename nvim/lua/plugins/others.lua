return {

    -- Git
    {
        'lewis6991/gitsigns.nvim',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function() require('gitsigns').setup() end
    },

    -- Undo tree
    {'mbbill/undotree'},

    -- Variable illuminate
    {'RRethy/vim-illuminate'},

    -- Comment helper
    {'tpope/vim-commentary'},

    -- Autopairs
    {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    },

    -- Indent Blanktline
    {'lukas-reineke/indent-blankline.nvim'},

}
