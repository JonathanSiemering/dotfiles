local dap = require('dap')
local dapui = require('dapui')

dap.adapters.go = {
    type = 'executable';
    command = 'node';
    args = {os.getenv('HOME') .. '/.local/share/vscode-go/dist/debugAdapter.js'};
}
dap.configurations.go = {
    {
        type = 'go';
        name = 'Debug';
        request = 'launch';
        showLog = false;
        program = "${file}";
        dlvToolPath = '/mnt/c/Users/Jonathan/go/bin/dlv';
    }
}

dapui.setup({})
