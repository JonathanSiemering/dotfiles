local lsp = require('lspconfig')

lsp.omnisharp.setup{
    cmd = {
        os.getenv('HOME') .. "/.local/share/nvim/mason/packages/omnisharp/omnisharp",
    },
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = false,
    enable_import_completion = true,
    analyze_open_documents_only = false
}
