#! /bin/sh
# Enable composition
compton --config ~/.compton.conf &

# Java windows
wmname LG3D

# Set background image
feh --bg-tile $HOME/Imágenes/wallpapers/capheine.png

# Tray bar
trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --widthtype pixel --width 191 --transparent true --alpha 0 --tint 0x232C31 --height 18 --margin 1441 &

# pypanel &

#Python version fix for some programs
PYTHONPATH=/usr/lib/python2.7/site-packages
dropboxd &
volumeicon &
ubuntuone-launch &

export PYTHONPATH=/usr/lib/python3.3/site-packages
