local dap = require('dap')

dap.adapters.netcoredbg = {
    type = 'executable',
    command = os.getenv('HOME') .. '/.local/share/netcoredbg/netcoredbg',
    args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
    {
        type = 'netcoredbg',
        name = 'Debug',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to dll ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end
    }
}
