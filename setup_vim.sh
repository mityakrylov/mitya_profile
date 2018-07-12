#!/usr/bin/env bash

rm -rf ~/.vim

# colors
mkdir -p ~/.vim/colors
git clone https://github.com/vim-scripts/wombat256.vim.git
cp -f wombat256.vim/colors/wombat256mod.vim ~/.vim/colors/
rm -rf wombat256.vim

# vimrc
cp -f vimrc ~/.vimrc

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# install youcompleteme
pushd ~/.vim/bundle/YouCompleteMe
./install.py
popd
