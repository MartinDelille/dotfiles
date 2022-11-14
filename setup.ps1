New-Item -Force -ItemType SymbolicLink -Path ~/vimfiles/autoload/plug.vim -Value $PSScriptRoot/vendors/vim-plug/plug.vim
New-Item -Force -ItemType SymbolicLink -Path ~/.vimrc -Value $PSScriptRoot/vimrc
New-Item -Force -ItemType SymbolicLink -Path "$Env:XDG_CONFIG_HOME/nvim/init.vim" -Value $PSScriptRoot/vimrc
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$Env:XDG_CONFIG_HOME/nvim/autoload/plug.vim" -Force
New-Item -Force -ItemType SymbolicLink -Path ~/.gitconfig -Value $PSScriptRoot/git/windows
New-Item -Force -ItemType SymbolicLink -Path $Env:XDG_CONFIG_HOME/git -Value $PSScriptRoot/git

scoop bucket add extras
scoop install git-aliases posh-git diff-so-fancy make nvim

vi +PlugInstall +PlugUpdate +qall
