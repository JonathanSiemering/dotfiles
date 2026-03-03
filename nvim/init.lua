vim.g.mapleader = ' '

require('settings')

-- Install lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

-- Auto-update on fresh install (install.sh creates this file)
local update_file = vim.fn.stdpath('config') .. '/update'
if vim.uv.fs_stat(update_file) then
    vim.api.nvim_create_autocmd('VimEnter', {
        once = true,
        callback = function()
            require('lazy').restore()
            vim.cmd('TSUpdate')
            vim.cmd('MasonUpdate')
            os.remove(update_file)
        end,
    })
end
