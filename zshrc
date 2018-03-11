#zmodload zsh/zprof

fpath=(${HOME}/.dotfiles/functions $fpath)
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle osx
antigen bundle sudo

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle supercrabtree/k
antigen bundle paulirish/git-open

antigen theme agnoster

antigen apply

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
