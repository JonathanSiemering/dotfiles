return {
    'akinsho/toggleterm.nvim',
    config = function()
        local term = require('toggleterm')
        local terminal = require('toggleterm.terminal').Terminal

        term.setup()

        -- lazygit
        local lazygit = terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = 'float',
        })

        function Lazygit_toggle()
            lazygit:toggle()
        end
    end
}

