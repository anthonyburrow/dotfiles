if [ -f "$HOME/.secret/env.sh" ]; then
    source "$HOME/.secret/env.sh"
fi

export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

eval "$(dircolors -b ~/.config/dircolors)"
alias ls='ls --color=auto'

RESET="\[\e[0m\]"
DIRCOLOR="\[\033[0;91m\]"
ARROWCOLOR="\[\033[0;91m\]"
PS1="${DIRCOLOR}\w ${ARROWCOLOR}❯${RESET} "
