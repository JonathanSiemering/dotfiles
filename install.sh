#!/bin/sh

# go to folder of script
cd `dirname $0`
script_dir=`pwd`

case $DOTFILES_OS in

    "ubuntu")
        sudo apt update
        sudo apt -y install zsh git curl wget vim ripgrep make cmake gcc socat bat tmux

        scripts/configs.sh
        scripts/download-neovim.sh
        scripts/fzf.sh
        ;;

    "arch")
        sudo pacman -S zsh git curl wget vim ripgrep make cmake gcc socat bat tmux

        scripts/configs.sh
        scripts/download-neovim.sh
        scripts/fzf.sh
        ;;

    "macos")
        brew install zsh git curl wget vim ripgrep make cmake gcc socat bat tmux nvim

        scripts/configs.sh
        scripts/fzf.sh
        ;;

    *)
        echo "DOTFILES_OS not specified or supported"
        ;;

esac
