#! /bin/sh
# Enable composition
compton --config ~/.compton.conf &

# Java windows
wmname LG3D

# Set background image
#feh --bg-tile $HOME/Imágenes/wallpapers/capheine.png
wallpaper.sh

# Tray bar
trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --widthtype pixel --width 189 --transparent true --alpha 0 --tint 0x232C31 --height 18 --margin 1441 &

# pypanel &

# xrdb -merge ~/.Xdefaults

#Python version fix for some programs
PYTHONPATH=/usr/lib/python2.7/site-packages
dropboxd &
volumeicon &
ubuntuone-launch &

conky -c ~/.conky/Zukitwo/Celsius/God-Mode/Weather-Fav-color/.conkyrc &

export PYTHONPATH=/usr/lib/python3.3/site-packages

# Apps
urxvt -e zsh -c "maintmux" &
firefox &

