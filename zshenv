# Oh my zsh
export DEFAULT_USER=martin
#Add my custom script
export PATH=$PATH:$HOME/.dotfiles/bin
# Add Qt
#export PATH=$PATH:$HOME/Qt/5.4/clang_64/bin
# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# Pyenv
export PATH=~/.pyenv/shims:$PATH
# Coverity tools
export PATH=~/tools/cov-analysis-macosx-7.7.0.4/bin:$PATH
# Git
if [[ "$OSTYPE" = darwin* ]]; then
  export GIT_CREDENTIAL=osxkeychain
else
  export GIT_CREDENTIAL="cache --timeout=3600"
fi
# Gisty
export GISTY_DIR=~/dev/gists
#export GISTY_ACCESS_TOKEN= I don't want to publish that
# Android utility
export PATH=~/dev/libs/android-sdk-macosx/tools:~/dev/libs/android-sdk-macosx/platform-tools:$PATH
# FFMpeg
export PATH=$PATH:$FFMPEG_DEV_PATH/bin

# IRC info
export IRCNICK=capradmar
export IRCSERVER=irc.freenode.net
# Other
export HOMEBREW_EDITOR=vi
export TERM="xterm-256color"

# Various alias
alias j="cd ~/dev/Joker"
alias y="cd ~/dev/YouDub"
alias pbpc="pbpaste | pbcopy"
alias ip="ifconfig | grep inet"
alias ccat="pygmentize -g"
alias pgss="pgs && say kowabunga"
