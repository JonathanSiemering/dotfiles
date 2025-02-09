#!/bin/sh

# neovim
nvim_dir=~/.local/nvim
mkdir -p $nvim_dir
cd $nvim_dir

rm -r ../nvim/* # be sure not remove on wrong directory

case $DOTFILES_ARCH in

    "arm")
        [ -d nvim-linux-arm64 ] && rm -r nvim-linux-arm64
        wget -O nvim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz
        ;;

    *)
        [ -d nvim-linux-x86_64 ] && rm -r nvim-linux-x86_64
        wget -O nvim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
        ;;

esac

tar xzf nvim.tar.gz --strip-components=1
rm nvim.tar.gz

cd $script_dir
