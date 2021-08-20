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

    highlight link DapBreakpoint GruvboxRed
    highlight link DapLogPoint GruvboxRed
    highlight link DapBreakpointRejected GruvboxRed
    highlight link DapStopped GruvboxAqua
    highlight link DapStoppedBg guibg=#303030
]])
