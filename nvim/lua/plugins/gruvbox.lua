local g = vim.g

g.gruvbox_contrast_dark = 'hard'

vim.cmd([[
    colorscheme gruvbox

    highlight clear SignColumn
    highlight GruvboxAquaSign guibg=none
    highlight GruvboxGreenSign guibg=none
    highlight GruvboxOrangeSign guibg=none
    highlight GruvboxPurpleSign guibg=none
    highlight GruvboxRedSign guibg=none
    highlight GruvboxYellowSign guibg=none

    highlight String guifg=#bcd7de
]])
