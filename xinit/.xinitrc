#!/bin/sh
#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources

#set the cursor
xsetroot -cursor_name left_ptr

export TERM=xterm-256color

export LANG=es_ES.UTF-8
export LANGUAGE=es
export SHELL=/bin/bash

setxkbmap -layout es

xmodmap ~/.Xmodmap
numlockx &

session=${1:-bspwm}

case $session in
bspwm)
    ibus-daemon -drx
    sxhkd &
    export QT_QPA_PLATFORMTHEME=qt5ct
    export QT_STYLE_OVERRIDE=kvantum-dark
    [ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
    mkfifo "$PANEL_FIFO"
    exec bspwm -c ~/.config/bspwm/bspwmrc
    ;;
xfce4)
    exec startxfce4
    ;;
plasma)
    export DESKTOP_SESSION=plasma
    exec startplasma-x11
    ;;
wmaker)
    exec wmaker
    ;;
dwm)
    exec dwm
    ;;
esac
