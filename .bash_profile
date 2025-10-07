if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# Fix for urxvt
clear

export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.local/bin

export PYTHONPATH=$PYTHONPATH:$HOME/.bin/abpy
export PYTHONPATH=$PYTHONPATH:$HOME/.bin/python_scripts

alias devpip="$HOME/dev/.venv/bin/python -m pip"

python() {
    local dir="$PWD"
    local fallback="$HOME/dev/.venv/bin/python"

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

