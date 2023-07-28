return {
    'mhartington/formatter.nvim',
    config = function()
        require('formatter').setup({
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                -- ToDo load project specific
                javascript = { require('formatter.filetypes.javascript').prettier },
                typescript = { require('formatter.filetypes.typescript').prettier },
                html = { require('formatter.filetypes.html').prettier },
            }
        })

        vim.api.nvim_create_autocmd("BufWritePost", {
            command = "FormatWrite"
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "FormatterPre",
            command = "lua vim.notify('Formatting file...')"
        })
        vim.api.nvim_create_autocmd("User", {
            pattern = "FormatterPost",
            command = "lua vim.notify('File formatted')"
        })
    end
}
