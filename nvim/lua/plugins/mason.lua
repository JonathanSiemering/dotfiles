return {
    'williamboman/mason.nvim',
    priority = 800,
    config = function() require('mason').setup() end
}
