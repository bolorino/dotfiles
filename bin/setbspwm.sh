#! /bin/sh
# Enable composition
compton --config ~/.compton.conf &

# Java windows
wmname LG3D

# Set background image
wallpaper.sh

# Tray bar
trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --widthtype pixel --width 135 --transparent true --alpha 0 --tint 0x232C31 --height 18 --margin 1441 &

#Python version fix for some programs
PYTHONPATH=/usr/lib/python2.7/site-packages
dropboxd &
volumeicon &
album-art.py &

conky -c ~/.conky/withcovers/.conkyrc &

export PYTHONPATH=/usr/lib/python3.3/site-packages

# Apps
urxvt -e zsh -c "maintmux" &
firefox &
