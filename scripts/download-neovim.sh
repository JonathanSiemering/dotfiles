#!/bin/sh

# neovim
nvim_dir=~/.local/nvim
mkdir -p $nvim_dir
cd $nvim_dir
[ -d nvim-linux64 ] && rm -r nvim-linux64
wget -O nvim.tar.gz https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzf nvim.tar.gz
rm nvim.tar.gz
cd $script_dir
