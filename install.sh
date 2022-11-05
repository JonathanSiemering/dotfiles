#!/bin/sh

# go to folder of script
cd `dirname $0`
script_dir=`pwd`

# install packages
if [ -x `command -v apt` ]; then
    # debian based
    sudo apt update
    sudo apt -y install zsh git curl wget vim ripgrep make cmake gcc socat

    [ -x `command -v fish` ] && sudo apt remove fish
elif [ -x `command -v pacman` ]; then
    # arch based
    sudo pacman -S zsh git curl wget vim ripgrep make cmake gcc socat

    [ -x `command -v fish` ] && sudo pacman -R fish
elif [ -x `command -v brew` ]; then
    # mac os
    brew install zsh git curl wget vim ripgrep make cmake gcc socat
else
    echo "OS not supported"
    exit
fi

#config
mkdir -p ~/.config

# set fish as default shell
chsh -s /usr/bin/zsh

# mkdir .local
mkdir ~/.local

# install fzf
fzf_dir=~/.local/fzf
if [ -d $fzf_dir ]; then
    cd $fzf_dir
    git pull
    cd $script_dir
else
    git clone --depth 1 https://github.com/junegunn/fzf.git $fzf_dir
fi
$fzf_dir/install --key-bindings --completion --no-update-rc

# neovim
nvim_dir=~/.local/nvim
mkdir -p $nvim_dir
cd $nvim_dir
rm -r nvim-linux64
wget -O nvim.tar.gz https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzf nvim.tar.gz
cd $script_dir

rm -r ~/.config/nvim
ln -s $script_dir/nvim ~/.config
touch $script_dir/nvim/update

# insert or replace dotfiles
cp -f .profile ~/
cp -f .zshrc ~/
cp -f .vimrc ~/
cp -f .tmux.conf ~/

# remove deprecated 
[ -d ~/.nvim ] && rm -rf ~/.nvim
[ -d ~/.fzf ] && rm -rf ~/.fzf
[ -d ~/.config/fish ] && rm -rf ~/.config/fish
