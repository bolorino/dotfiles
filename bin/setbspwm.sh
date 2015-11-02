#! /bin/sh
# xrandr layout
#.screenlayout/leftof.sh &

# Enable composition
compton --config ~/.compton.conf &

# Java windows
wmname LG3D

# Terminal
TERMINAL=xfce4-terminal

# Set background image
wallpaper.sh

# Restrict Huion graphic table to main monitor
xinput set-prop "1060PRO Pen" --type=float "Coordinate Transformation Matrix" 0.571428 0 0.428571 0 1 0 0 0 1

# Tray bar
trayer --edge bottom --align right --SetDockType true --SetPartialStrut true  --expand true --widthtype requested --transparent true --alpha 0 --tint 0x333333 --height 18 --margin 10 &

#Python version fix for some programs
PYTHONPATH=/usr/lib/python2.7/site-packages

#Enable video acceleration
export VDPAU_DRIVER=radeonsi

owncloud &
volumeicon &

#PYTHONPATH=/usr/lib/python3.4/site-packages

# Apps
rofi -key-run mod4+F2 -key-ssh mod4+F7 -key-window mod4+F5 -terminal urxvt &
$TERMINAL --command "maintmux" &
