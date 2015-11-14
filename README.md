# Dotfiles

My custom dotfiles.

## Installation

    cd
    git clone git@github.com:MartinDelille/dotfiles.git .dotfiles
    .dotfiles/bin/dotfiles_setup.sh

## Linux

Here are the paquet required to use this *dotfiles*:

    sudo apt-get install git

Here are some more step to configure Zsh:

    chsh -s $(which zsh)

Here are the step to install the *Powerline* font needed by the *agnoster* theme (taken from [here](https://powerline.readthedocs.org/en/latest/installation/linux.html#fonts-installation):

    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
    mv PowerlineSymbols.otf ~/.fonts/
    fc-cache -vf ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d/
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
