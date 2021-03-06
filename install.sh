#!/bin/sh

# go to folder of script
cd `dirname $0`
script_dir=`pwd`

# install packages
if [ `command -v apt | wc -l` -gt 0 ]; then
    # debian based
    sudo apt update
    sudo apt -y install fish git curl wget vim ripgrep make cmake gcc socat
elif [ `command -v pacman | wc -l` -gt 0 ]; then
    # arch based
    sudo pacman -S fish git curl wget vim ripgrep make cmake gcc socat
elif [ `command -v brew | wc -l` -gt 0 ]; then
    # mac os
    brew install fish git curl wget vim ripgrep make cmake gcc socat
else
    echo "OS not supported"
    exit
fi

#config
mkdir -p ~/.config

# set zsh as default shell
chsh -s /usr/bin/fish

# install fzf
fzf_dir=~/.fzf
if [ -d $fzf_dir ]; then
    cd $fzf_dir
    git pull
    cd $script_dir
else
    git clone --depth 1 https://github.com/junegunn/fzf.git $fzf_dir
fi
$fzf_dir/install --key-bindings --completion --no-update-rc

# neovim
nvim_dir=~/.nvim
mkdir -p $nvim_dir
cd $nvim_dir
rm -r nvim-linux64
wget -O nvim.tar.gz https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzf nvim.tar.gz
cd $script_dir

rm -r ~/.config/nvim
ln -s $script_dir/nvim ~/.config
touch $script_dir/nvim/update

rm -r ~/.config/fish
ln -s $script_dir/fish ~/.config

# insert or replace dotfiles
cp -f .vimrc ~/
