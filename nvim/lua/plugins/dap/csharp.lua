local dap = require('dap')

dap.adapters.netcoredbg = {
    type = 'executable',
    command = os.getenv('HOME') .. '/.local/share/nvim/mason/packages/netcoredbg/netcoredbg',
    args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
    {
        type = 'netcoredbg',
        name = 'launch',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to dll ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end
    },
    {
        type = 'netcoredbg',
        name = 'attach',
        request = 'attach',
        processId = function()
            return vim.fn.input('Process id ')
        end
    }
}
