if [[ -z "$SSH_CONNECTION" && -z "$DISPLAY" && "${XDG_VTNR}" == "1" ]]; then
  exec startx
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi