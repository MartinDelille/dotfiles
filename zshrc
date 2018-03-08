#zmodload zsh/zprof

fpath=(${HOME}/.dotfiles/functions $fpath)
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/brew
  zgen oh-my-zsh plugins/osx
  zgen oh-my-zsh plugins/sudo

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions

  zgen load supercrabtree/k

  zgen load agnoster/agnoster-zsh-theme agnoster

  zgen load martindelille/git-open . http

  # generate the init script from plugins above
  zgen save
fi

# Next commented lines where not migrated since zgen:

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="true"
# added by travis gem
#[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# NPM completion
source <(npm completion)
#eval "$(gulp --completion=zsh)"

#zprof
