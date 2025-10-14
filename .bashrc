# bind 'set bell-style none'
xset b off

# Fix for urxvt
clear

export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

export PYTHONPATH="$PYTHONPATH:$HOME/.bin/abpy"
export PYTHONPATH="$PYTHONPATH:$HOME/.bin/python_scripts"

DEV_DIR="$HOME/dev"
VENV_BIN_DIR="$DEV_DIR/.venv/bin"

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias pip_dev="$VENV_BIN_DIR/pip"
alias jupyter_dev="$VENV_BIN_DIR/jupyter"

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
