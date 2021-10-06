$root=$PSScriptRoot
mkdir -Force -p ~/vimfiles/autoload
New-Item -Force -ItemType SymbolicLink -Path ~/vimfiles/autoload/plug.vim -Value $root/vendors/vim-plug/plug.vim
New-Item -Force -ItemType SymbolicLink -Path ~/.vimrc -Value $root/vimrc
New-Item -Force -ItemType SymbolicLink -Path ~/.gitconfig -Value $root/git/config

vim +PlugClean +PlugInstall +PlugUpdate +qall
