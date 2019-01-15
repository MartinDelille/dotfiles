# Dotfiles

[![Build Status](https://travis-ci.org/MartinDelille/dotfiles.svg?branch=master)](https://travis-ci.org/MartinDelille/dotfiles)

My custom dotfiles.

![Screenshot](screenshot.png)

## Installation

```
$ git clone --recurse-submodules https://github.com/MartinDelille/dotfiles ~/.dotfiles
$ ~/.dotfiles/bin/dotsetup
$ chsh -s $(which fish)
$ exit
```

## Linux

Here are the paquet required to use this *dotfiles*:

```
sudo apt-get install git
```

Here are the step to install the *Powerline* font needed by the *agnoster* theme (taken from [here](https://powerline.readthedocs.org/en/latest/installation/linux.html#fonts-installation):

```
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
```

