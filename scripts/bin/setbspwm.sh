#! /bin/sh

# Enable composition
picom &

# Java windows
fixjava.sh &

# Terminal
TERMINAL=alacritty

# Set background image
# Random image
#wallpaper.sh
feh --bg-scale ${HOME}/sync/wallpapers/wp1925119-qhd-wallpapers.jpg

${HOME}/.config/polybar/launch.sh

dunst &

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

# Widgets
nm-applet &
kdeconnect-indicator &
# blueman-applet &
owncloud &
nextcloud &
redshift-gtk &

# Kill KDE keyboard shortcuts started by DBus
killall -TERM kglobalaccel5

# Apps
$TERMINAL -e "maintmux" &

