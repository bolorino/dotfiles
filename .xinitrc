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

xrdb -merge ~/.Xresources

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
    xrandr --output VGA0 --mode 1440x900 --pos 0x0 --rotate normal --output DVI-1 --mode 1920x1080 --pos 1440x0 --rotate normal --output DVI-0 --off --output HDMI-0 --off
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
wmaker)
    exec wmaker
    ;;
esac
