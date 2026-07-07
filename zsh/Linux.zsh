# Go path
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GPG_TTY=$(tty)

alias -g C='|& xclip -selection clipboard'
alias o="xdg-open"
alias or="nautilus --select"
alias grvc="git rev-parse HEAD | tr -d '\n' | xclip -selection clipboard"
alias fd=fdfind
alias rgc='rg "$(xclip -o -selection clipboard)"'
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"

