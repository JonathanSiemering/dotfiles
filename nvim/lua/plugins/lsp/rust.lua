local lsp = require('lspconfig')
local cmp = require('cmp_nvim_lsp')

local capabilities = cmp.default_capabilities()

lsp.rust_analyzer.setup{
    capabilities = capabilities
}
