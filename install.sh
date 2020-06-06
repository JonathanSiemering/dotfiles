#!/bin/sh

# go to script folder
cd $0

# install packages
sudo apt update
sudo apt -y install zsh git curl

# set zsh as default shell
chsh -s $(which zsh)

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install zsh plugins
mkdir -p ~/.local/zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.local/zsh/plugins/

# insert or replace dotfiles
cp -f .profile ~/
cp -f .zshrc ~/
cp -f .vimrc ~/
