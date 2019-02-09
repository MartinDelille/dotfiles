# Install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# iTerm integration
source ~/.dotfiles/fish/iterm2_shell_integration.(basename $SHELL)

# Qt
set QTVERSION 5.12.0
#set QTPATH $HOME/Qt/$QTVERSION/clang_64
set QTPATH /usr/local/Cellar/qt/$QTVERSION
set PATH $PATH $QTPATH/bin
set QT_INSTALL_DOCS $QTPATH/doc

# Path
set PATH ~/.dotfiles/bin $PATH
set PATH /usr/local/opt/ruby/bin $PATH

# Other environment variables
set -gx VISUAL vim
set -gx EDITOR vim

# Secret
if test -e ~/.secret
  source ~/.secret
end

# Alias

alias x="exit"
alias q="exit"
alias l="ls -lah"
alias p="pgs && say kowabounga"
alias m="make"
alias j="cd ~/dev/YouDub/Joker"
alias s="cd ~/dev/Lylo/screenr"
alias y="cd ~/dev/YouDub"
alias n="open ~/Dropbox/notes.md"
alias pbpc="pbpaste | pbcopy"
alias ip="ifconfig | grep 'inet '"
alias o="open"
alias r="open -R"
alias f="find . -name"
alias acki="ack -i"
alias lmb="lab mr b"
