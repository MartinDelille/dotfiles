#!/bin/bash

if [[ "$OSTYPE" = linux* ]]; then
  echo "### Linux specific: Install Git, Vim and ZSH ###"
  sudo apt-get install -y git vim zsh
fi

if [[ ! -d ~/.dotfiles ]]; then
  echo "### Cloning dotfiles ###"
  git clone https://github.com/MartinDelille/dotfiles ~/.dotfiles
else
  git --git-dir ~/.dotfiles/.git pull
fi

echo "### Linking configuration ###"
ln -s ~/.dotfiles/zshenv ~/.zshenv
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/gitignore ~/.gitignore
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/ ~/.vim/

if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
  echo "### Install Vundle ###"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

echo "### Install Oh my Zsh ###"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

