if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.bin/synow/src

export PYTHONPATH=$PYTHONPATH:$HOME/.bin/spextractor
export PYTHONPATH=$PYTHONPATH:$HOME/.bin/abpy
export PYTHONPATH=$PYTHONPATH:$HOME/.bin/SNIaDCA
export PYTHONPATH=$PYTHONPATH:$HOME/.bin/synPy
