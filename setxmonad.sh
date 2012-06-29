#! /bin/sh
# Enable composition
xcompmgr -I1 -O1 -Ff &

# Set background image
feh --bg-tile Imágenes/wallpapers/black-wood-1920x1200.jpg 

# Tray bar
trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --widthtype pixel --width 190 --transparent true --tint 0x000000 --height 12 --margin 1 &
sleep 2

# Background apps
dropbox start &
# Backups
/usr/local/bin/junglediskdesktop &

# Run terminal
x-terminal-emulator &

export _JAVA_AWT_WM_NONREPARENTING=1 
