#!/bin/sh

[ -f $HOME/.xprofile ] && . $HOME/.xprofile

resources_file=$HOME/.Xresources

if [ -f "$resources_file" ]; then
    xrdb -merge "$resources_file"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

$HOME/.bin/displayToDefault

exec i3
