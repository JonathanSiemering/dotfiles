local lsp = require('lspconfig')
local cmp = require('cmp_nvim_lsp')

local capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.tsserver.setup{
    capabilities = capabilities
}
