# Install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Alias

alias x="exit"
alias q="exit"
alias l="ll"
alias p="pgs && say kowabounga"
alias m="make"
alias j="cd ~/dev/YouDub/Joker"
alias s="cd ~/dev/Lylo/screenr"
alias y="cd ~/dev/YouDub"
alias n="open ~/Dropbox/notes.md"
alias pbpc="pbpaste | pbcopy"
alias ip="ifconfig | grep 'inet '"
alias o="open"
alias r="open -R"
alias f="find . -name"
alias lmb="lab mr b"

# Path

set PATH ~/.dotfiles/bin $PATH
