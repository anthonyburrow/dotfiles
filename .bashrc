# Fix for urxvt
clear

if [ -f "$HOME/.secret/env.sh" ]; then
    source "$HOME/.secret/env.sh"
fi

export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

export PYTHONPATH="$PYTHONPATH:$HOME/.bin/abpy"
export PYTHONPATH="$PYTHONPATH:$HOME/.bin/python_scripts"

DEV_DIR="$HOME/dev"
VENV_BIN_DIR="$DEV_DIR/.venv/bin"

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias pip_dev="$VENV_BIN_DIR/pip"
jupyter_dev() {
    "$HOME/dev/.venv/bin/jupyter" "$@"
}

eval "$(dircolors -b ~/.config/dircolors)"
alias ls='ls --color=auto'

RESET="\[\e[0m\]"
USERCOLOR="\[\e[38;2;180;142;173m\]"
HOSTCOLOR="\[\e[38;2;136;192;208m\]"
DIRCOLOR="\[\e[38;5;67m\]"
PS1="${USERCOLOR}\u${RESET}@${HOSTCOLOR}\h ${DIRCOLOR}\w ${RESET}\$ "

python() {
    local dir="$PWD"
    local fallback="$VENV_BIN_DIR/python"

    # Search upward for a .venv
    while [ "$dir" != "/" ]; do
        if [ -x "$dir/.venv/bin/python" ]; then
            "$dir/.venv/bin/python" "$@"
            return $?
        fi
        dir=$(dirname "$dir")
    done

    # Fallback to your preferred .venv
    if [ -x "$fallback" ]; then
        "$fallback" "$@"
        return $?
    fi

    # Final fallback: system Python
    if command -v python >/dev/null 2>&1; then
        command /usr/bin/python "$@"
    else
        echo "Error: no .venv found, and no system Python available." >&2
        return 1
    fi
}
