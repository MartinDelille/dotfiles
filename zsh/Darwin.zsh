export GIT_CREDENTIAL=osxkeychain

alias ff="mdfind -onlyin ."
alias kw="say kowabounga"
alias wifi="networksetup -setairportpower airport"
alias n="open ~/Dropbox/notes.md"
alias po="p && open"
alias chrome="open -a /Applications/Google\ Chrome.app"
alias o="open"
alias or="open -R"
alias q="open $HOME/dev/Qt/Qt\ Creator.app"
alias b="brew"
alias bo="HOMEBREW_NO_AUTO_UPDATE=1 pgs && brew"
alias qtlog="vi ~/Library/Preferences/QtProject/qtlogging.ini"
alias grvc="git rev-parse --short head | tr -d '\n' | pbcopy"
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
alias lci="sleep 2;lab ci trace;say $(basename $(pwd))"
alias lcv="sleep 2;lab ci view"
alias ghprw="sleep 1;gh pr checks --watch; kw"

# Java
export JAVA_HOME=`/usr/libexec/java_home`
export PATH=${JAVA_HOME}/bin:$PATH
export MAVEN_OPTS="-Xmx512m"

function pbc {
  cat $1 | pbcopy
}

function pbsha {
  git log --oneline --decorate -n 1 $1
  git log --format=format:%H -n 1 $1 | pbcopy
}
