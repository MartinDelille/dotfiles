export GIT_CREDENTIAL=osxkeychain

alias ff="mdfind -onlyin ."
alias kw="say kowabounga"
alias wifi="networksetup -setairportpower airport"
alias q="open $HOME/dev/Qt/Qt\ Creator.app"
alias b="brew"
alias bo="HOMEBREW_NO_AUTO_UPDATE=1 pgs && brew"
alias qtlog="vi ~/Library/Preferences/QtProject/qtlogging.ini"
alias grvc="git rev-parse --short head | tr -d '\n' | pbcopy"

#eval "$(docker-machine env default)"

# Java
export JAVA_HOME=`/usr/libexec/java_home`
export PATH=${JAVA_HOME}/bin:$PATH
export MAVEN_OPTS="-Xmx512m"

function pbc {
  cat $1 | pbcopy
}
