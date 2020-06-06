#!/bin/sh

# go to folder of script
cd `dirname $0`
script_dir=`pwd`

# install packages
sudo apt update
sudo apt -y install zsh git curl

# set zsh as default shell
chsh -s $(which zsh)

# install fzf
fzf_dir=~/.fzf
if [ -d $fzf_dir ]; then
    cd $fzf_dir
    git pull
    cd $script_dir
else
    git clone --depth 1 https://github.com/junegunn/fzf.git $fzf_dir
fi
$fzf_dir/install

# install zsh plugins
zsh_syntax_highlighting_dir=~/.local/zsh/plugins/zsh-syntax-highlighting
if [ -d $zsh_syntax_highlighting_dir ]; then
    cd $zsh_syntax_highlighting_dir
    git pull
    cd $script_dir
else
    mkdir -p $zsh_syntax_highlighting_dir
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $zsh_syntax_highlighting_dir
fi

# insert or replace dotfiles
cp -f .profile ~/
cp -f .zshrc ~/
cp -f .vimrc ~/
