#!/bin/sh

# go to folder of script
cd `dirname $0`
script_dir=`pwd`

# install packages
if [ -x `command -v apt` ]; then
    # debian based
    sudo apt update
    sudo apt -y install zsh git curl wget vim ripgrep make cmake gcc socat bat tmux
elif [ -x `command -v pacman` ]; then
    # arch based
    sudo pacman -S zsh git curl wget vim ripgrep make cmake gcc socat bat tmux
elif [ -x `command -v brew` ]; then
    # mac os
    brew install zsh git curl wget vim ripgrep make cmake gcc socat bat tmux nvim
else
    echo "OS not supported"
    exit
fi

#config
mkdir -p ~/.config

# set zsh as default shell
chsh -s /bin/zsh

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

# neovim
nvim_dir=~/.local/nvim
mkdir -p $nvim_dir
cd $nvim_dir
[ -d nvim-linux64 ] && rm -r nvim-linux64
wget -O nvim.tar.gz https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzf nvim.tar.gz
rm nvim.tar.gz
cd $script_dir

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

# remove deprecated 
[ -d ~/.config/fish ] && rm -rf ~/.config/fish
[ -d ~/.nvim ] && rm -rf ~/.nvim
[ -d ~/.fzf ] && rm -rf ~/.fzf
