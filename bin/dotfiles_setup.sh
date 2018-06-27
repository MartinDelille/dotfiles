#!/bin/bash

if [[ "$OSTYPE" = linux* ]]; then
  sudo apt-get update
  echo "### Linux specific: Install Git, Vim and ZSH ###"
  sudo apt-get install -y git vim zsh openssh-server curl
fi

if [[ "$OSTYPE" = darwin* ]]; then
    brew install antigen node
fi

PWD=`pwd`

echo "### Updating dotfiles ###"
git -C $PWD/.git pull

echo "### Linking configuration ###"
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/zshenv ~/.zshenv
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/gitignore ~/.gitignore
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/ftplugin ~/.vim/ftplugin
if [[ "$OSTYPE" = darwin* ]]; then
    ln -s $PWD/my.env.plist ~/Library/LaunchAgents/my.env.plist
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
elif [[ "$OSTYPE" = darwin* ]]; then
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
fi

if [[ ! -d ~/.zgen ]]; then
  echo "### Install zgen ###"
  git clone https://github.com/tarjoilija/zgen.git ~/.zgen
else
  echo "### Upgrade zgen ###"
  git -C ~/.zgen pull
fi

