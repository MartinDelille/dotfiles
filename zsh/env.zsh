export EDITOR=nvim
# Oh my zsh
export DEFAULT_USER=`whoami`
#Add my custom script
export PATH=$PATH:$HOME/.dotfiles/bin
# Homebrew

[ -f /opt/homebrew/bin ] && eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=/opt/homebrew/bin:/usr/local/sbin:$PATH
# Coverity tools
export PATH=~/tools/cov-analysis-macosx-7.7.0.4/bin:$PATH
# Go
export GOPATH=~/dev/go
#export GOROOT=/usr/local/opt/go
export PATH=$GOROOT/libexec/bin:$GOPATH/bin:$PATH
# Git
export GIT_CREDENTIAL="cache --timeout=3600"
# IRC info
export IRCNICK=martinodelilo
export IRCSERVER=irc.freenode.net
# GPG
export GPG_TTY=$(tty)
# Other
export HOMEBREW_EDITOR=vi
export TERM="xterm-256color"
export CONAN_HOOK_ERROR_LEVEL=40

# Various alias
alias m="make"
alias mm="make"
alias i="invoke"
alias j="cd ~/dev/phonations/core"
alias t="cd ~/dev/tests"
alias ls="eza --icons=always"
alias l="ls -lah"
alias lo="ls -ls modified"
alias lodl="lo ~/Downloads"
alias d="cd ~/.dotfiles"
alias rm="Use trash or full /bin/rm"
alias dnv="cd ~/.config/nvim/lua/md/plugins"
alias dv="cd ~/dev/md"
alias cci="cd ~/dev/conan/cci/recipes"
alias adm="cd ~/dev/adm/atelier-medias.org"
alias dev="cd ~/dev"
alias dalle="cd ~/dev/phonations/python-scripts/dalle"
alias pbpc="pbpaste | pbcopy"
alias ip="ifconfig | grep 'inet '"
alias ccat="pygmentize -g"
alias p="pgs && say kowabounga"
alias acki="ack -i"
alias gap="ga -p"
alias x="exit"
alias xx="exit"
alias xxx="exit"
alias xxxx="exit"
#alias ls="colorls --dark --sort-dirs --report"
#alias lc="colorls --tree --dark"
alias f="find . -name"
alias lmb="glab mr view --web"
alias play="ffplay -autoexit"
alias ghprb="sleep 1 && gh pr view --web"
alias ghrvw="sleep 1 && gh repo view --web"

# Alias waiting to be merged here: <https://github.com/ohmyzsh/ohmyzsh/pull/9676>
alias gcfx='git commit --fixup'
alias glom='git log --oneline --decorate --color $(git_main_branch)..'
alias glov='git log --oneline --decorate --color origin/$(git_develop_branch)..'
alias grbmi='git rebase $(git_main_branch) --interactive'
alias grbmia='git rebase $(git_main_branch) --interactive --autosquash'
alias gsuri='git submodule update --recursive --init'

alias greseth="git reset HEAD~1"
alias gresethh="git reset HEAD~2"
alias gresethhh="git reset HEAD~3"
alias gcfxh="git commit --fixup HEAD"
alias gcfxhh="git commit --fixup HEAD~1"
alias gcfxhhh="git commit --fixup HEAD~2"
alias gcfxhhhh="git commit --fixup HEAD~3"
alias gshh="git show HEAD~1"
alias gshhh="git show HEAD~2"
alias gshhhh="git show HEAD~3"
alias gafx="git autofixup -v"
alias gafxm="git autofixup master -v"
alias gafm="git autofixup main -v"
alias gcwrm="git commit -m wip_remove"
alias glof="git log --oneline --decorate --graph --follow"
alias rmorig="find . -name '*.orig' -exec trash {} \;"
[ -f /opt/homebrew/bin/nvim ] && alias vi=nvim
[ -f /opt/homebrew/bin/nvim ] && alias v=nvim
[ -f /opt/homebrew/bin/nvim ] && alias e=nvim
[ -f /usr/local/bin/nvim ] && alias vi=nvim
[ -f /usr/local/bin/nvim ] && alias v=nvim
alias pgssh="pgs spiron.local && ssh spiron.local -p 2222"

alias glci="glab ci trace; say 'CI done'"

## Sourcing OS-specific things
OS=$(uname -s); export OS
if [[ -f ~/.dotfiles/zsh/${OS}.zsh ]]; then
    if [[ ! -z $ZSHDEBUG ]]; then
        echo +++ ~/.dotfiles/zsh/${OS}.zsh
    fi
    source ~/.dotfiles/zsh/${OS}.zsh
fi

if [[ -f ~/.cargo/env ]]; then
    source ~/.cargo/env
fi

# Color

red=$'\e[1;31m'
grn=$'\e[1;32m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
white=$'\e[0m'

function md {
  mkdir $1 && cd $1
}

function pdf {
  vared -p 'Output file name ? ' -c output
  gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$output.pdf $@
}

function dfs {
  vared -p 'Application ? ' -ch app
  vared -p 'Setting ? ' -ch setting
  vared -p 'Value ? ' -ch value
  defaults write tv.lylo.$app $setting $value
  defaults read tv.lylo.$app
}

function gcfxf {
  git log -n 1 --pretty=format:%h $1 | xargs git commit --fixup
}
[ -f $HOME/.cargo ] && . "$HOME/.cargo/env"

function pipreq() {
  if [ "$1" ]; then
    pip freeze | grep "^$1==" >> requirements.txt
  else
    echo "Error: Please specify an argument."
  fi
}
