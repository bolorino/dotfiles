#! /bin/sh
# Enable composition
xcompmgr -I1 -O1 -Ff &

# Set background image
feh --bg-tile Imágenes/wallpapers/xmonad-wp.png

# Tray bar
trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --widthtype pixel --width 190 --transparent true --tint 0x000000 --height 12 --margin 1 &
sleep 1

# Background apps
dropbox start &

# Run terminal
x-terminal-emulator &

export _JAVA_AWT_WM_NONREPARENTING=1 
