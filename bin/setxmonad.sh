#! /bin/sh
# Enable composition
# xcompmgr -I1 -O1 -Ff &
compton --config ~/.compton.conf &

# Set background image
feh --bg-tile Imágenes/wallpapers/xmonad-wp.png

# Tray bar
trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --widthtype pixel --width 191 --transparent true --alpha 0 --tint 0x27241E --height 19 --margin 1441 &
sleep 1

# Background apps
dropbox start &

# Run terminal
urxvt &

export _JAVA_AWT_WM_NONREPARENTING=1 
