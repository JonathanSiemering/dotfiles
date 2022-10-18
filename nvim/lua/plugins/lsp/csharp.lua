local lsp = require('lspconfig')
local cmp = require('cmp_nvim_lsp')

local capabilities = cmp.default_capabilities()

lsp.omnisharp.setup{
    cmd = {
        os.getenv('HOME') .. "/.local/share/nvim/mason/packages/omnisharp/omnisharp",
    },
    enable_editorconfig_support = true,
    capabilities = capabilities,
}
