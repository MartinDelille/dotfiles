#!/bin/bash

ln -s ~/.dotfiles/zshenv ~/.zshenv
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
