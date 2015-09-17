#Add my custom script
export PATH=$PATH:$HOME/.dotfiles/bin
# Add Qt
export PATH=$PATH:$HOME/Qt/5.4/clang_64/bin
# Pyenv
export PATH=/usr/local/bin:$PATH
export PATH=~/.pyenv/shims:$PATH
# Gisty
export GISTY_DIR=~/dev/gists
#export GISTY_ACCESS_TOKEN= I don't want to publish that
# Android utility
#export PATH=~/dev/libs/adt-bundle-mac-x86_64-20140321/sdk/platform-tools:$PATH
# IRC info
export IRCNICK=capradmar
export IRCSERVER=irc.freenode.net
# Other
export HOMEBREW_EDITOR=vi
export TERM="xterm-256color"

# Various alias
alias j="cd ~/dev/Joker"
alias pbpc="pbpaste | pbcopy"
alias ip="ifconfig | grep inet"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
