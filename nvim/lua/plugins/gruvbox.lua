local g = vim.g

g.gruvbox_contrast_dark = 'hard'

vim.cmd([[
    colorscheme gruvbox

    highlight clear SignColum
    highlight GruvboxAquaSign guibg=none
    highlight GruvboxGreenSign guibg=none
    highlight GruvboxOrangeSign guibg=none
    highlight GruvboxPurpleSign guibg=none
    highlight GruvboxRedSign guibg=none
    highlight GruvboxYellowSign guibg=none

    highlight String guifg=#bcd7de

    highlight GalaxylineAqua guifg=#427b58
    highlight GalaxylineBlue guifg=#83a598
    highlight GalaxylineYellow guifg=#fabd2f
    highlight GalaxylineRed guifg=#cc241d
    highlight GalaxylineGreen guifg=#98971a

    highlight link DapBreakPoint galaxylinered
    highlight link DapLogPoint galaxylinered
    highlight link DapBreakPointRejected galaxylinered
    highlight link DapStopped galaxylineaqua
    highlight DapStoppedLineHl guibg=#303030

    highlight Yanked guibg=#1c3f47 guifg=#9e9e9e
]])
