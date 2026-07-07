export GIT_CREDENTIAL=osxkeychain

alias ff="mdfind -onlyin ."
alias kw="say kowabounga"
alias wifi="networksetup -setairportpower airport"
alias po="p && open"
alias chrome="open -a /Applications/Google\ Chrome.app"
alias o="open"
alias or="open -R"
alias q="open \"$HOME/Qt/Qt Creator.app\""
alias b="brew"
alias bo="HOMEBREW_NO_AUTO_UPDATE=1 pgs && brew"
alias qtlog="vi ~/Library/Preferences/QtProject/qtlogging.ini"
alias qtdbg="vi ~/Qt/Qt\ Creator.app/Contents/Resources/debugger/personaltypes.py"
alias grvc="git rev-parse --short head | tr -d '\n' | pbcopy"
alias dl="cd ~/Downloads"
alias s="cd ~/Library/Application\ Support"
alias defr="defaults read"
alias defw="defaults write"
alias drr="defaults read ~/Library/Preferences/tv.lylo.RecordR"
alias dwr="defaults write ~/Library/Preferences/tv.lylo.RecordR"
alias drj="defaults read ~/Library/Preferences/tv.lylo.JokeR"
alias dwj="defaults write ~/Library/Preferences/tv.lylo.JokeR"
alias drs§="defaults read tv.lylo.SilcroW"
alias dws§="defaults write tv.lylo.SilcroW"
alias dr§="defaults read ~/Library/Preferences/tv.lylo.SilcroW"
alias dw§="defaults write ~/Library/Preferences/tv.lylo.SilcroW"
alias ghprw="sleep 1;gh pr checks --watch; kw"
alias ghrw="sleep 1;gh run watch; kw"
alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias thd='theme "Solarized Dark"'
alias thl='theme OneHalfLight'
alias svenv='source venv/bin/activate'
alias ytc='yt-dlp "$(pbpaste)"'

setopt extendedglob
function uma {
  echo "Before unmounting:"
  /bin/ls /Volumes
  umount /Volumes/^Macintosh*/
  sleep 1
  echo "After unmounting:"
  /bin/ls /Volumes
}

function pbc {
  cat $1 | pbcopy
}
alias lcv="sleep 2;glab ci view"

function pbsha {
  git log --oneline --decorate -n 1 $1
  git log --format=format:%H -n 1 $1 | pbcopy
}

alias -g C='|& pbcopy'

alias ip="ifconfig | grep 'inet '"

nt() {
    local default_title="Notification"
    local default_message="You have a new notification"
    local title message

    if [ $# -eq 0 ]; then
        title="$default_title"
        message="$default_message"
    elif [ $# -eq 1 ]; then
        title="$default_title"
        message="$1"
    else
        title="$1"
        message="$2"
    fi

    if [ -n "$TMUX" ]; then
        # Inside tmux - wrap the escape sequence
        printf '\ePtmux;\e\e]777;notify;%s;%s\e\e\\\e\\' "$title" "$message"
    else
        # Outside tmux - direct escape sequence
        printf '\e]777;notify;%s;%s\e\\'  "$title" "$message"
    fi
}


