#!/bin/bash

if [[ "$OSTYPE" = linux* ]]; then
  echo "### Ubuntu specific: Add universe repository ###"
  sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu/ main restricted universe"
  sudo apt-get update
  echo "### Linux specific: Install Git, Vim and ZSH ###"
  sudo apt-get install -y git vim zsh openssh-server curl
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
if [[ "$OSTYPE" = darwin* ]]; then
    ln -s ~/.dotfiles/my.env.plist ~/Library/LaunchAgents/my.env.plist
fi

echo "### Install vim-plug ###"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "### Install Vim plugin ###"
vim +PlugInstall +qall

echo "### Install Powerline font"
if [[ "$OSTYPE" = linux* ]]; then
  wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
  wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
  mv PowerlineSymbols.otf ~/.fonts/
  fc-cache -vf ~/.fonts/
  mkdir -p ~/.config/fontconfig/conf.d/
  mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fi

if [[ ! -d ~/.oh-my-zsh ]]; then
  echo "### Install Oh my Zsh ###"
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "### Upgrade Oh my Zsh ###"
  upgrade_oh_my_zsh
fi

