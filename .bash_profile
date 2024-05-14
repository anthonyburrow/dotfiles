if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# Fix for urxvt
clear

export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.local/bin

export PYTHONPATH=$PYTHONPATH:$HOME/.bin/abpy
export PYTHONPATH=$PYTHONPATH:$HOME/.bin/python_scripts
