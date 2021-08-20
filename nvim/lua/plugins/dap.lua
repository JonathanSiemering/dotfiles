local g = vim.g
local dap = require('dap')
local dapui = require('dapui')

-- GO
dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = true
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print('dlv exited with code', code)
      end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require('dap.repl').append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)
  end
  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "."
    }
}

-- C#
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

dapui.setup({})

g.dap_virtual_text = true
