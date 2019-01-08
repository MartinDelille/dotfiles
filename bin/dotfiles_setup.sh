#!/bin/bash

INSTALL_SCRIPT_PATH=`pwd`/$0
INSTALL_SCRIPT_RELATIVE_PATH='/bin/dotfiles_setup.sh'
DOTFILES_ROOT=${INSTALL_SCRIPT_PATH%$INSTALL_SCRIPT_RELATIVE_PATH};

echo "Dotfiles root: $DOTFILES_ROOT"

if [[ "$OSTYPE" = linux* ]]; then
  sudo add-apt-repository -y ppa:jonathonf/vim
  sudo apt update
  echo "### Linux specific: Install Git, Vim and ZSH ###"
  sudo apt install -y git vim zsh openssh-server curl
fi

if [[ "$OSTYPE" = darwin* ]]; then
  which brew
  if [ $? -eq 1 ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew tap caskroom/fonts
  brew tap martindelille/tap
  xargs brew install < $DOTFILES_ROOT/brew.txt
  xargs brew cask install < $DOTFILES_ROOT/cask.txt
fi

echo "### Updating dotfiles ###"
git -C $DOTFILES_ROOT/.git pull

echo "### Linking configuration ###"
ln -sf $DOTFILES_ROOT/zshrc ~/.zshrc
ln -sf $DOTFILES_ROOT/zshenv ~/.zshenv
ln -sf $DOTFILES_ROOT/gitconfig ~/.gitconfig
ln -sf $DOTFILES_ROOT/gitignore ~/.gitignore
ln -sf $DOTFILES_ROOT/vimrc ~/.vimrc
mkdir -p $DOTFILES_ROOT/.vim/autoload
ln -sf $DOTFILES_ROOT/vendors/vim-plug/plug.vim ~/.vim/autoload/plug.vim

if [[ "$OSTYPE" = darwin* ]]; then
    ln -sf $DOTFILES_ROOT/my.env.plist ~/Library/LaunchAgents/my.env.plist
fi

echo "### Install Vim plugin ###"
vim +PlugInstall +qall

echo "### Install Powerline font"
$DOTFILES_ROOT/vendors/fonts/install.sh
