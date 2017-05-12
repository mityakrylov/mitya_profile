#!/usr/bin/env bash

################################################################################
# setup profile

mkdir -p $HOME/tmp
mkdir -p $HOME/bin

cp -f .profile $HOME/.profile
touch $HOME/.profile_custom

################################################################################
# setup vim

# colors
mkdir -p $HOME/.vim/colors
git clone git@github.com:vim-scripts/wombat256.vim.git
cp -f wombat256.vim/colors/wombat256mod.vim $HOME/.vim/colors/
rm -rf wombat256.vim

# vimrc
cp -f .vimrc $HOME/.vimrc

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

################################################################################
# setup tmux


################################################################################
# setup git

