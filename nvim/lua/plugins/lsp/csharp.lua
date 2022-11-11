local vars = require('utils.vars')
local lsp = require('lspconfig')
local cmp = require('cmp_nvim_lsp')

local capabilities = cmp.default_capabilities()

lsp.omnisharp.setup{
    cmd = {
        vars.dataPath .. "/mason/packages/omnisharp/omnisharp",
    },
    enable_editorconfig_support = true,
    enable_roslyn_analyzers = true,
    enable_import_completion = true,
    capabilities = capabilities,
}
