local dapui = require('dapui')

dapui.setup({
    layouts = {
        {
            position = "right",
            size = 60,
            elements = {
                "stacks",
                {id = "breakpoints", size = 0.15},
                {id = "watches", size = 0.15},
            },
        },
        {
            position = "bottom",
            size = 0.2,
            elements = {
                "repl",
                {id = "console", size = 0.20},
            },
        },
    },
})

