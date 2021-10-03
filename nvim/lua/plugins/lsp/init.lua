-- Change sign colum icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Load plugins
require('plugins.lsp.go')
require('plugins.lsp.csharp')
require('plugins.lsp.cpp')
require('plugins.lsp.lua')
