local g = vim.g

g.gruvbox_contrast_dark = 'hard'

vim.cmd([[
    colorscheme gruvbox
    highlight clear SignColumn

    highlight String guifg=#bcd7de
]])
