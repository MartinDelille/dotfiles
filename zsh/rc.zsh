autoload -Uz compinit
compinit

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
ZIM_HOME=${DOTFILES}/vendors/zimfw/

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

#zprof

setopt autocd

[ -f $HOME/.secret ] && source $HOME/.secret

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Make Ctrl+e accept autosuggestion
bindkey '^e' autosuggest-accept

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt autocd
setopt inc_append_history_time

# Ruby / rbenv
eval "$(rbenv init - zsh)"

[ -f /opt/homebrew/bin/thefuck ] && eval $(thefuck --alias)

[ -f "$HOME/.config/op/plugins.sh" ] && source "$HOME/.config/op/plugins.sh"

PERL_ROOT="$HOME/perl5"
PATH="$PERL_ROOT/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$PERL_ROOT/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$PERL_ROOT${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$PERL_ROOT\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$PERL_ROOT"; export PERL_MM_OPT;


if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi
