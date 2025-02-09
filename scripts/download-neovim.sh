#!/bin/sh

# neovim
nvim_dir=~/.local/nvim
mkdir -p $nvim_dir
cd $nvim_dir
[ -d nvim-linux-x86_64 ] && rm -r nvim-linux-x86_64
wget -O nvim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xzf nvim.tar.gz
rm nvim.tar.gz
cd $script_dir
