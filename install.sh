#!/bin/zsh

# install packages
sudo apt update
sudo apt -y upgrade
sudo apt -y install zsh git curl

# set zsh as default shell
chsh -s $(which zsh)

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install bat
wget https://github.com/sharkdp/bat/releases/download/v0.15.4/bat-musl_0.15.4_amd64.deb
sudo dpkg -i bat-musl_0.15.4_amd64.deb
rm bat-musl_0.15.4_amd64.deb

# install micronano 
curl https://getmic.ro | bash
mkdir -p ~/.local/bin
sudo mv micro ~/.local/bin/

# install zsh plugins
mkdir -p ~/.local/zsh/plugins
cd ~/.local/zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
cd ~

# set dotfiles
cp -f .profile ~/
cp -f .zshrc ~/

mkdir -p ~/.config/micro
cp micro_settings.json ~/.config/micro/settings.json