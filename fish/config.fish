# Install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# iTerm integration
source ~/.dotfiles/fish/iterm2_shell_integration.fish

# Qt
#set QT_DIR $HOME/Qt/$QT_VERSION/clang_64
set QT_DIR /usr/local/opt/qt
set PATH $PATH $QT_DIR/bin

# Go
set -gx GOPATH ~/dev/go

# Path
set PATH ~/.dotfiles/bin $PATH
set PATH /usr/local/opt/ruby/bin $PATH
set PATH (gem environment gemdir)/bin $PATH
set PATH $GOPATH/bin $PATH
set -gx PATH ~/.cargo/bin $PATH

# MacOS specifics
if test (uname -s) = "Darwin"
  set PATH ~/.iterm2 $PATH
  set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
  abbr -a gmt git mergetool --no-prompt --tool=opendiff
end

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
alias xx="exit"
alias xxx="exit"
alias l="ls -lah"
alias p="pgs && say kowabounga"
alias m="make"
alias j="cd ~/dev/phonations/joker"
alias lftpj="lftp -u $JOKER_FTP_USER,$JOKER_FTP_PASSWORD $JOKER_FTP_SERVER -e \"set ftp:ssl-allow no;ls\""
alias s="cd ~/dev/Lylo/screenr"
alias t="cd ~/dev/md/therapie"
alias y="cd ~/dev/YouDub"
alias q="open ~/dev/Qt/Qt\ Creator.app"
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

function pbc
  if test $argv
    cat $argv | pbcopy
  else
    echo "Too many args for md command"
  end
end

# bobthefish theme configuration
set -g fish_prompt_pwd_dir_length 0
set -g theme_display_date no
