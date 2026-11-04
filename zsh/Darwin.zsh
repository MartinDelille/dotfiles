# Homebrew (Apple Silicon)
[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

export GIT_CREDENTIAL=osxkeychain

alias copy-to-clipboard="pbcopy"
alias paste-from-clipboard="pbpaste"

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

setopt extendedglob
function uma {
  echo "Before unmounting:"
  /bin/ls /Volumes
  umount /Volumes/^Macintosh*/
  sleep 1
  echo "After unmounting:"
  /bin/ls /Volumes
}

alias lcv="sleep 2;glab ci view"

alias ip="ifconfig | grep 'inet '"

