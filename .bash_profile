if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

export PATH=$PATH:~/.bin
export PYTHONPATH="${PYTHONPATH}:$HOME/.bin/spextractor"
