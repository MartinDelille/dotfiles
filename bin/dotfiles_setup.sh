#!/bin/bash

if [[ "$OSTYPE" = linux* ]]; then
  sudo apt-get update
  echo "### Linux specific: Install Git, Vim and ZSH ###"
  sudo apt-get install -y git vim zsh openssh-server curl
fi

if [[ ! -d ~/.dotfiles ]]; then
  echo "### Cloning dotfiles ###"
  git clone https://github.com/MartinDelille/dotfiles ~/.dotfiles
else
  git -C ~/.dotfiles/.git pull
fi

echo "### Linking configuration ###"
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/zshenv ~/.zshenv
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/gitignore ~/.gitignore
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/ftplugin ~/.vim/ftplugin
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
elif [[ "$OSTYPE" = darwin* ]]; then
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
fi
