require('dap')

vim.fn.sign_define('DapBreakpoint', {text = '', texthl = 'DapBreakpoint', linehl = '', numhl = ''})
vim.fn.sign_define('DapLogPoint', {text = '', texthl = 'DapLogPoint', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped', {text = '', texthl = 'DapStopped', linehl = 'DapStoppedLineHl', numhl = ''})
vim.fn.sign_define('DapBreakpointRejected', {text = '', texthl = 'DapBreakpointRejected', linehl = '', numhl = ''})

require('plugins.dap.go')
require('plugins.dap.csharp')
