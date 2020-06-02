#! /bin/sh

# Enable composition
compton &

# Java windows
wmname LG3D

# Terminal
TERMINAL=termite

# Set background image
# Random image
# wallpaper.sh
feh --bg-scale ${HOME}/Imágenes/wallpapers/Desktop/3CcuWNl.jpg

# Restrict graphic table to main monitor
# http://ubuntuforums.org/showthread.php?t=1656089&p=10330180#post10330180
# 1490x900 1920x1080
# xinput set-prop "1060PRO Pen" --type=float "Coordinate Transformation Matrix" 0.571428 0 0.428571 0 1 0 0 0 1
# 1920x1080 x2
# Right monitor
#xinput set-prop "1060PRO Pen" --type=float "Coordinate Transformation Matrix" 0.5 0 0.5 0 1 0 0 0 1
# Left monitor
# Tablet not detected. Take off 
# xinput set-prop "1060PRO Pen" --type=float "Coordinate Transformation Matrix" 0.5 0 0 0 1 0 0 0 1

# Tray bar
trayer --edge bottom --align right --SetDockType true --SetPartialStrut true  --expand true --widthtype requested --transparent true --alpha 0 --tint 0x333333 --height 18 --margin 10 &

#Enable video acceleration
export VDPAU_DRIVER=radeonsi

# Start some programs
owncloud &
kdeconnect-indicator &
# hamster &
redshift-gtk &

$TERMINAL -e "maintmux" &
