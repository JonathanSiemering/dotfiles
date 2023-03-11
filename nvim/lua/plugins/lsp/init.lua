local vars = require('utils.vars')

-- Change sign colum icons
local signs = { Error = " " .. vars.lspErrorIcon, Warn = " " .. vars.lspWarningIcon, Hint = " " .. vars.lspHintIcon, Info = " " .. vars.lspInfoIcon }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Load plugins
require('plugins.lsp.go')
require('plugins.lsp.csharp')
require('plugins.lsp.cpp')
require('plugins.lsp.lua')
require('plugins.lsp.tsserver')
require('plugins.lsp.angularls')
require('plugins.lsp.bashls')
require('plugins.lsp.rust')
require('plugins.lsp.terraform')
