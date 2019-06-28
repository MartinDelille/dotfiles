# Install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# iTerm integration
source ~/.dotfiles/fish/iterm2_shell_integration.(basename $SHELL)

# Qt
set -gx QT_HOMEBRREW true
set -gx QT_VERSION 5.12.3
#set QT_DIR $HOME/Qt/$QT_VERSION/clang_64
set -gx QT_DIR /usr/local/Cellar/qt/$QT_VERSION
set PATH $PATH $QT_DIR/bin
set QT_INSTALL_DOCS $QT_DIR/doc

# Go
set -gx GOPATH ~/dev/go

# Path
set PATH ~/.dotfiles/bin $PATH
set PATH /usr/local/opt/ruby/bin $PATH
set PATH /usr/local/opt/python $PATH
set PATH $GOPATH/bin $PATH

# Other environment variables
set -gx VISUAL vim
set -gx EDITOR vim
set -gx GPG_TTY (tty)
set -gx LANG "en_US.UTF-8"

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
alias j="cd ~/dev/phonations/joker"
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
alias python=python3
alias pip=pip3
alias play="ffplay -autoexit"

# Functions

function md
  switch (count $argv)
    case 0
      echo "usage: md <directory>"
    case 1
      mkdir $argv[1]
      cd $argv[1]
    case '*'
      echo "Too many args for md command"
  end
end
