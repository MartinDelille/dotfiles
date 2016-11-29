source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/brew
  zgen oh-my-zsh plugins/zsh-syntax-highlighting
  zgen oh-my-zsh plugins/osx
  zgen oh-my-zsh plugins/sudo

  zgen oh-my-zsh themes/agnoster

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions

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

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

