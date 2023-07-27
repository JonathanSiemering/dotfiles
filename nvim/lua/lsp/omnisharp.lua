local lspconfig = require('lspconfig')
lspconfig['omnisharp'].setup {
    enable_editorconfig_support = true,
    enable_roslyn_analyzers = true,
    enable_import_completion = true,
    root_dir = function(fname)
        -- First search for .sln and then for .csproj
        -- root_pattern(x, x) will find the .csproj first
        local sln = lspconfig.util.root_pattern('*.sln')(fname)
        local csproj = lspconfig.util.root_pattern('*.csproj')(fname)
        return sln or csproj
    end
}

-- Project specific config
-- https://github.com/OmniSharp/omnisharp-roslyn/wiki/Configuration-Options
--
-- Example:
-- omnisharp.json:
-- {
--   "fileOptions": {
--     "systemExcludeSearchPatterns": [
--       "**/node_modules/**/*",
--       "**/bin/**/*",
--       "**/obj/**/*"
--     ],
--     "excludeSearchPatterns": []
--   }
-- }
