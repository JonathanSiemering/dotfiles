return {
    'rmagatti/auto-session',
    config = function()
        require('auto-session').setup({
            auto_session_allowed_dirs = {
                '~/dev/*',
                '~/.dotfiles/dotfiles/*',
            },
        });
    end
}
