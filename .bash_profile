if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.bin/synow/src
export PATH=$PATH:$HOME/.local/bin

export PYTHONPATH=$PYTHONPATH:$HOME/.bin/spextractor
export PYTHONPATH=$PYTHONPATH:$HOME/.bin/abpy
export PYTHONPATH=$PYTHONPATH:$HOME/.bin/SNIaDCA
export PYTHONPATH=$PYTHONPATH:$HOME/.bin/synPy
export PYTHONPATH=$PYTHONPATH:$HOME/.bin/SNEx
export PYTHONPATH=$PYTHONPATH:$HOME/.bin/python_scripts
