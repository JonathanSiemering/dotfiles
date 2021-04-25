#!/bin/sh

# go to folder of script
cd `dirname $0`
script_dir=`pwd`

# install packages
if [ `command -v zsh | wc -l` -eq 0 ] ||
   [ `command -v git | wc -l` -eq 0 ] ||
   [ `command -v curl | wc -l` -eq 0 ] ||
   [ `command -v vim | wc -l` -eq 0 ] ||
   [ `command -v ripgrep | wc -l` -eq 0 ]; then
    if [ `command -v apt | wc -l` -gt 0 ]; then
        # debian based
        sudo apt update
        sudo apt -y install zsh git curl vim ripgrep
    elif [ `command -v pacman | wc -l` -gt 0 ]; then
        # arch based
        sudo pacman -S zsh git curl vim ripgrep
    else
        echo "OS not supported"
        exit
    fi
fi

# set zsh as default shell
if [ $SHELL != $(which zsh) ]; then
    chsh -s $(which zsh)
fi

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
nvim_dir=~/.nvim
mkdir -p $nvim_dir
cd $nvim_dir
rm -r nvim-linux64
wget -O nvim.tar.gz https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar xzf nvim.tar.gz
cd $script_dir

# insert or replace dotfiles
cp -f .profile ~/
cp -f .zshrc ~/
cp -f .vimrc ~/

mkdir -p ~/.config/nvim
cp -f nvim/init.vim ~/.config/nvim
