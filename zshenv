export EDITOR=vim
# Oh my zsh
export DEFAULT_USER=`whoami`
#Add my custom script
export PATH=$PATH:$HOME/.dotfiles/bin
# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# Python
export PATH=/usr/local/opt/python/libexec/bin:$PATH
# Coverity tools
export PATH=~/tools/cov-analysis-macosx-7.7.0.4/bin:$PATH
# Go
export GOPATH=~/dev/go
#export GOROOT=/usr/local/opt/go
export PATH=$PATH:$GOROOT/libexec/bin:$GOPATH/bin
# Git
export GIT_CREDENTIAL="cache --timeout=3600"
export GIT_MERGETOOL=vimdiff
# Gisty
export GISTY_DIR=~/dev/gists
#export GISTY_ACCESS_TOKEN= I don't want to publish that
# Android utility
export PATH=~/dev/libs/android-sdk-macosx/tools:~/dev/libs/android-sdk-macosx/platform-tools:$PATH
# FFMpeg
#export PATH=$PATH:$FFMPEG_DEV_PATH/bin

# Qt
export QTVERSION=5.6.3
export QTPATH=$HOME/Qt/$QTVERSION/clang_64
export PATH=$PATH:$QTPATH/bin

# IRC info
export IRCNICK=martinodelilo
export IRCSERVER=irc.freenode.net
# Other
export HOMEBREW_EDITOR=vi
export TERM="xterm-256color"

# Various alias
alias m="make"
alias j="cd ~/dev/YouDub/Joker"
alias s="cd ~/dev/Lylo/screenr"
alias y="cd ~/dev/YouDub"
alias n="open ~/Dropbox/notes.md"
alias pbpc="pbpaste | pbcopy"
alias ip="ifconfig | grep 'inet '"
alias ccat="pygmentize -g"
alias p="pgs && say kowabounga"
alias po="p && open"
alias acki="ack -i"
alias ovh="ssh ovh.phonations.com"
alias chrome="open -a /Applications/Google\ Chrome.app"
alias gap="ga -p"
alias x="exit"
alias q="exit"
alias o="open"
alias or="open -R"
#alias ls="colorls --dark --sort-dirs --report"
#alias lc="colorls --tree --dark"
alias f="find . -name"
alias lmb="lab mr b"

## Sourcing OS-specific things
OS=$(uname -s); export OS
if [[ -f ~/.dotfiles/zsh.${OS} ]]; then
    if [[ ! -z $ZSHDEBUG ]]; then
        echo +++ ~/.dotfiles/zsh.${OS}
    fi
    source ~/.dotfiles/zsh.${OS}
fi

# Color

red=$'\e[1;31m'
grn=$'\e[1;32m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
white=$'\e[0m'


source $HOME/.dotfiles/bin/iterm.sh
