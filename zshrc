#zmodload zsh/zprof

fpath=(${HOME}/.dotfiles/functions $fpath)
source $HOME/.dotfiles/vendors/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle osx
antigen bundle sudo

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle supercrabtree/k
antigen bundle paulirish/git-open
antigen bundle popstas/zsh-command-time

#antigen theme agnoster
#antigen theme denysdovhan/spaceship-prompt
antigen theme bhilburn/powerlevel9k

antigen apply

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="true"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

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
if [ -f '/usr/local/bin/npm' ]; then source <(npm completion); fi
#eval "$(gulp --completion=zsh)"

#zprof

# Google Cloud

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/dev/google-cloud-sdk/path.zsh.inc" ]; then source "${HOME}/dev/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/dev/google-cloud-sdk/completion.zsh.inc" ]; then source "${HOME}/dev/google-cloud-sdk/completion.zsh.inc"; fi

# Spaceship prompt theme
SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL=" \uf0e7"
SPACESHIP_CHAR_PREFIX="\uf296"
SPACESHIP_CHAR_SUFFIX=(" ")
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_USER_SHOW="true"

# Powerlevel9K prompt theme

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_medium context dir vcs newline status)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_beer dir vcs newline status)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_medium custom_freecodecamp dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete'

# Add the custom beer icon prompt segment
POWERLEVEL9K_CUSTOM_BEER="echo -n '\u1F37A'"
#POWERLEVEL9K_CUSTOM_BEER="black"
#POWERLEVEL9K_CUSTOM_BEER="white"

# Add the custom Medium M icon prompt segment
POWERLEVEL9K_CUSTOM_MEDIUM="echo -n '\uF859'"
POWERLEVEL9K_CUSTOM_MEDIUM_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_MEDIUM_BACKGROUND="white"

# Add the custom freeCodeCamp prompt segment
POWERLEVEL9K_CUSTOM_FREECODECAMP="echo -n '\uE242' freeCodeCamp"
POWERLEVEL9K_CUSTOM_FREECODECAMP_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_FREECODECAMP_BACKGROUND="cyan"

# zsh command time setup

# If command execution time above min. time, plugins will not output time.
ZSH_COMMAND_TIME_MIN_SECONDS=3

# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"

# Message color.
ZSH_COMMAND_TIME_COLOR="cyan"

zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
            timer_show="$fg[green]$ZSH_COMMAND_TIME s."
        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
            timer_show="$fg[yellow]$min min. $sec s."
        else
            if [ "$hours" -gt 0 ]; then
                min=$(($min%60))
                timer_show="$fg[red]$hours h. $min min. $sec s."
            else
                timer_show="$fg[red]$min min. $sec s."
            fi
        fi
        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
    fi
}

[ -f $HOME/.secret ] && source $HOME/.secret ]

