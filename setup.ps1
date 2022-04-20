$root=$PSScriptRoot
mkdir -Force -p ~/vimfiles/autoload
New-Item -Force -ItemType SymbolicLink -Path ~/vimfiles/autoload/plug.vim -Value $root/vendors/vim-plug/plug.vim
New-Item -Force -ItemType SymbolicLink -Path ~/.vimrc -Value $root/vimrc
New-Item -Force -ItemType SymbolicLink -Path ~/.gitconfig -Value $root/git/windows
New-Item -Force -ItemType SymbolicLink -Path $Env:XDG_CONFIG_HOME/git -Value $root/git

scoop install diff-so-fancy

vim +PlugClean +PlugInstall +PlugUpdate +qall
