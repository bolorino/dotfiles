#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xdefaults

#set the cursor
xsetroot -cursor_name left_ptr
# set Spanish keyboard layout
setxkbmap -layout es

xmodmap ~/.Xmodmap
numlockx &

session=${1:-bspwm}

# xmonad
case $session in
bspwm)
    sxhkd &
    xrandr --output DFP3 --primary
    xrandr --output CRT1 --right-of DFP3
    [ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
    mkfifo "$PANEL_FIFO"
    exec bspwm
    ;;
xfce4)
    exec startxfce4
    ;;
gnome)
    exec gnome-session
    ;;
kde)
    exec startkde
    ;;
esac
