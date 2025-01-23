New-Item -Force -ItemType SymbolicLink -Path ~/.wezterm.lua -Value $PSScriptRoot/wezterm.lua
New-Item -Force -ItemType SymbolicLink -Path $PROFILE -Value $PSScriptRoot/powershell/profile.ps1
New-Item -Force -ItemType SymbolicLink -Path ~/AppData/Local/nvim -Value $PSScriptRoot/nvim
New-Item -Force -ItemType SymbolicLink -Path ~/.gitconfig -Value $PSScriptRoot/git/windows

scoop bucket add extras
scoop bucket add nerd-fonts
scoop install git-aliases posh-git diff-so-fancy make neovim Meslo-NF-Mono wezterm
scoop update neovim

