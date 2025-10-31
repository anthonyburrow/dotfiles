if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [[ -z "$SSH_CONNECTION" && -z "$DISPLAY" && "${XDG_VTNR}" == "1" ]]; then
  # bind 'set bell-style none'
  xset b off

  exec startx
fi
