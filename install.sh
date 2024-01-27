#!/bin/sh

# go to folder of script
cd `dirname $0`
script_dir=`pwd`

case $DOTFILES_OS in

    "ubuntu")
        sudo apt update
        sudo apt -y install zsh git curl wget vim ripgrep make cmake gcc socat bat tmux

        scripts/download-neovim.sh
        scripts/fzf.sh
        scripts/zsh-syntax-highlighting.sh
        scripts/spaceship.sh
        ;;

    "arch")
        sudo pacman -S zsh git curl wget vim ripgrep make cmake gcc socat bat tmux

        scripts/download-neovim.sh
        scripts/fzf.sh
        scripts/zsh-syntax-highlighting.sh
        scripts/spaceship.sh
        ;;

    "macos")
        brew install zsh git curl wget vim ripgrep make cmake gcc socat bat tmux nvim

        scripts/fzf.sh
        scripts/zsh-syntax-highlighting.sh
        scripts/spaceship.sh

        # amethyst
        [ -f ~/.amethyst.yml ] && rm -r ~/.amethyst.yml
        ln -s $script_dir/.amethyst.yml ~/.amethyst.yml
        ;;

    *)
        echo "DOTFILES_OS not specified or supported"
        exit 1
        ;;

esac

#config
mkdir -p ~/.config

# set zsh as default shell
chsh -s /bin/zsh

# mkdir .local
mkdir ~/.local

# nvim config
[ -d ~/.config/nvim ] && rm -r ~/.config/nvim
ln -s $script_dir/nvim ~/.config
touch $script_dir/nvim/update

# insert or replace dotfiles
[ -f ~/.profile ] && rm -r ~/.profile
ln -s $script_dir/.profile ~/.profile

[ -f ~/.zshrc ] && rm -r ~/.zshrc
ln -s $script_dir/.zshrc ~/.zshrc

[ -f ~/.vimrc ] && rm -r ~/.vimrc
ln -s $script_dir/.vimrc ~/.vimrc

[ -f ~/.tmux.conf ] && rm -r ~/.tmux.conf
ln -s $script_dir/.tmux.conf ~/.tmux.conf
