require('tokyonight').setup({
    transparent = true,
})

vim.cmd([[
    colorscheme tokyonight-night

    highlight GalaxylineAqua guifg=#427b58
    highlight GalaxylineBlue guifg=#83a598
    highlight GalaxylineYellow guifg=#fabd2f
    highlight GalaxylineRed guifg=#cc241d
    highlight GalaxylineGreen guifg=#98971a

    highlight link DapBreakpoint GalaxylineRed
    highlight link DapLogPoint GalaxylineRed
    highlight link DapBreakpointRejected GalaxylineRed
    highlight link DapStopped GalaxylineAqua
    highlight DapStoppedLineHl guibg=#303030
]])
