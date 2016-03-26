#! /bin/sh

# Enable composition
compton --config ~/.compton.conf &

# Java windows
wmname LG3D

# Terminal
TERMINAL=konsole

# Set background image
# Random image
#wallpaper.sh
feh --bg-scale ${HOME}/Imágenes/wallpapers/Desktop/geometer-one.jpe

# Restrict graphic table to main monitor
# http://ubuntuforums.org/showthread.php?t=1656089&p=10330180#post10330180
# 1490x900 1920x1080
# xinput set-prop "1060PRO Pen" --type=float "Coordinate Transformation Matrix" 0.571428 0 0.428571 0 1 0 0 0 1
# 1920x1080 x2
xinput set-prop "1060PRO Pen" --type=float "Coordinate Transformation Matrix" 0.5 0 0.5 0 1 0 0 0 1

# Tray bar (bottom right)
trayer --edge bottom --align right --SetDockType true --SetPartialStrut true  --expand true --widthtype requested --transparent true --alpha 0 --tint 0x333333 --height 18 --margin 10 &

#Python version fix for some programs
PYTHONPATH=/usr/lib/python2.7/site-packages

#Enable video acceleration
export VDPAU_DRIVER=radeonsi

# Launch some apps

#dropbox &

if [ -z "$(pidof owncloud)" ]
then
    owncloud &
fi

if [ -z "$(pidof volumeicon)" ]
then
    volumeicon &
fi

if [ -z "$(pidof redshift-gtk)" ]
then
    redshift-gtk &
fi

#PYTHONPATH=/usr/lib/python3.4/site-packages

# Apps
# Check: Rofi daemon mode is now removed.
#Please use your window manager binding functionality or xbindkeys to replace it.
# rofi -key-run SuperL+F2 -key-ssh SuperL+F7 -key-window SuperL+F5 -terminal urxvt &

$TERMINAL -e "maintmux" &
