#zmodload zsh/zprof

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

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid atload'_zsh_highlight_bind_widgets'
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait lucid
zinit light Aloxaf/fzf-tab

zinit ice wait lucid
zinit light kutsan/zsh-system-clipboard

zinit ice wait lucid
zinit light mattberther/zsh-pyenv

zinit ice wait lucid
zinit light rbenv/rbenv

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


if [ "$TERM_PROGRAM" != "Apple_Terminal" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
  eval "$(oh-my-posh init zsh --config ~/.dotfiles/zsh/omp.yaml)"
fi

