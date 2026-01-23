# zmodload zsh/zprof

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

DOTFILES=${HOME}/.dotfiles
fpath=(${DOTFILES}/functions $fpath)

DOTFILES_ZSH=${DOTFILES}/zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


# Plugins

zinit light "zsh-users/zsh-completions"
zinit light "zsh-users/zsh-autosuggestions"

zinit ice wait lucid atload'_zsh_highlight_bind_widgets'
zinit light "zsh-users/zsh-syntax-highlighting"

zinit ice wait lucid
zinit light "Aloxaf/fzf-tab"

zinit ice wait lucid
zinit light "kutsan/zsh-system-clipboard"

zinit ice wait lucid
zinit light "mattberther/zsh-pyenv"

zinit ice wait lucid
zinit light "rbenv/rbenv"

zinit ice wait lucid
zinit light "lukechilds/zsh-nvm"

# Initialize rbenv
eval "$(rbenv init - zsh)"

eval "$(direnv hook zsh)"


# Snippets
zinit snippet OMZP::1password
# zinit snippet OMZP::macos
zinit snippet OMZP::git

# Load completion
# autoload -Uz compinit -C
# autoload -U compinit && compinit

zstyle ':completion:*' rehash true
autoload -Uz compinit
if [[ -n "$ZSH_COMPDUMP" ]]; then
  compinit -C
else
  compinit
fi
zinit cdreplay -q

bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^f' autosuggest-accept

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'

HISTSIZE=10000000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt autocd
setopt inc_append_history_time

setopt autocd

[ -f $HOME/.secret ] && source $HOME/.secret

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

[ -f /opt/homebrew/bin/thefuck ] && eval $(thefuck --alias)

[ -f "$HOME/.config/op/plugins.sh" ] && source "$HOME/.config/op/plugins.sh"

PERL_ROOT="$HOME/perl5"
PATH="$PERL_ROOT/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$PERL_ROOT/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$PERL_ROOT${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$PERL_ROOT\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$PERL_ROOT"; export PERL_MM_OPT;

export EDITOR=nvim
export MANPAGER='nvim +Man!'

#Add my custom scripts
export PATH=$PATH:$HOME/.dotfiles/bin
export PATH=/opt/homebrew/bin:/usr/local/sbin:$PATH
export PATH=~/.ghcup/bin:$PATH
export TERM="xterm-256color"

# Homebrew
[ -f /opt/homebrew/bin ] && eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_EDITOR=nvim

# Various alias
alias -g C='|& pbcopy'

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
if [ "$TERM_PROGRAM" != "vscode" ]; then
  alias rm="Use trash or full /bin/rm"
fi
alias dnv="cd ~/.config/nvim/lua/plugins"
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
alias oc=opencode

git_main_ref() {
  branch="$(git_main_branch)"
  if git show-ref --verify --quiet "refs/remotes/origin/$branch"; then
    echo "origin/$branch"
  else
    echo "$branch"
  fi
}
alias gcfx='git commit --fixup'
alias glo='git log --decorate --color --pretty="format:%C(auto)%h %C(cyan)%cd%C(auto) %d %s" --date=format:%Y-%m-%d\ %H:%M'
alias glog=glo
alias glom='git log --decorate --color --pretty="format:%C(auto)%h %C(cyan)%cd%C(auto) %d %s" --date=format:%Y-%m-%d\ %H:%M $(git_main_ref)..'
alias glov='git log --decorate --color --pretty="format:%C(auto)%h %C(cyan)%cd%C(auto) %d %s" --date=format:%Y-%m-%d\ %H:%M origin/$(git_develop_branch)..'
alias grbia='git rebase --interactive --autosquash'
alias grbmi='git rebase $(git_main_ref) --interactive'
alias grbmia='git rebase $(git_main_ref) --interactive --autosquash'
alias gsuri='git submodule update --recursive --init'

alias greset="git reset"
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
alias gafxm='git autofixup $(git_main_ref) -v'
alias gafm="git autofixup main -v"
alias gcwrm="git commit -m wip_remove"
alias glof="git log --oneline --decorate --graph --follow"
alias rmorig="find . -name '*.orig' -exec trash {} \;"
[ -f /opt/homebrew/bin/nvim ] && alias vi=nvim
[ -f /opt/homebrew/bin/nvim ] && alias v=nvim
[ -f /opt/homebrew/bin/nvim ] && alias e=nvim
[ -f /usr/local/bin/nvim ] && alias vi=nvim
[ -f /usr/local/bin/nvim ] && alias v=nvim
alias pgssh="pgs spiron.local && ssh spiron.local"
alias sshwb="ssh win_build.tourcoing"
alias sshmb="ssh mac_build_silicon.tourcoing"
alias sshsp="ssh spiron.local"

alias glci=gli

source ~/.dotfiles/zsh/gli.zsh

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

function git_select_commit() {
  local range="$1"
  local format="%C(auto)%h %C(cyan)%ad%C(auto) %C(yellow)%d%C(auto) %s"
  git log --color=always --date=format:'%Y-%m-%d %H:%M:%S' \
    --pretty=format:"$format" $range | fzf --ansi | awk '{print $1}'
}

function gcfxf {
  commit=$(git_select_commit "$(git_main_ref)..")
  if [ -n "$commit" ]; then
    git commit --fixup="$commit"
  fi
}

function gshf {
  commit=$(git_select_commit "$(git_main_ref)..")
  if [ -n "$commit" ]; then
    echo -n "$commit" | pbcopy
    # if gshf argument is given, show the commit for the file passed as argument
    if [ -n "$1" ]; then
      git show "$commit" -- "$1"
    else
      git show "$commit"
    fi
  fi
}

function gcpbf {
  branch="$1"
  if [ -z "$branch" ]; then
    branch=$(git branch --all --format='%(refname:short)' --color=always | fzf --ansi )
  fi
  if [ -z "$branch" ]; then
    echo "Error: No branch selected." >&2
    return 1
  fi
  commit=$(git_select_commit "${git_main_ref}..${branch}")
  if [ -n "$commit" ]; then
    git cherry-pick "$commit"
  fi
}

function fzf_git_commit_widget() {
  local commit
  commit=$(git_select_commit)
  if [[ -n $commit ]]; then
    LBUFFER+="$commit"
  fi
  zle reset-prompt
}
zle -N fzf_git_commit_widget
bindkey '^g' fzf_git_commit_widget

[ -f $HOME/.cargo ] && . "$HOME/.cargo/env"

function pipreq() {
  if [ "$1" ]; then
    pip freeze | grep "^$1==" >> requirements.txt
  else
    echo "Error: Please specify an argument."
  fi
}
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

bii() {
  if [[ -z "$1" ]]; then
    echo "Usage: bii <package>"
    return 1
  fi

  local pkg="$1"
  brew info "$pkg"
  if brew info "$pkg" | grep -q "Not installed"; then
    read "reply?Install $pkg? (y/n): "
    if [[ "$reply" == "y" ]]; then
      brew install "$pkg"
    else
      echo "Not installing $pkg."
    fi
  else
    echo "$pkg is already installed."
  fi
}

if [ "$TERM_PROGRAM" != "Apple_Terminal" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
  eval "$(starship init zsh)"
fi

# Load Angular CLI autocompletion.
source <($HOME/.nvm/current/bin/ng completion script)

# zprof
