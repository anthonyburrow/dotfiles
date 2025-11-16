#!/bin/sh

resources_file=$HOME/.Xresources
colors_file=$HOME/.config/colors

if [ -f $colors_file ]; then
    set -a
    source $colors_file
    set +a
fi

$HOME/.config/fastfetch/gen_config
$HOME/.config/alacritty/gen_config

$HOME/.config/Xresources/gen_Xresources
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
