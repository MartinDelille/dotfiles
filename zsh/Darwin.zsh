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

#eval "$(docker-machine env default)"

# Java
export JAVA_HOME=`/usr/libexec/java_home`
export PATH=${JAVA_HOME}/bin:$PATH
export MAVEN_OPTS="-Xmx512m"

function pbc {
  cat $1 | pbcopy
}
