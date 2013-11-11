#!/bin/sh
. panel_colors

while true; do
        echo "Time Update"
        sleep 10
done > $PANEL_FIFO &

pidof xtitle > /dev/null || xtitle -s > $PANEL_FIFO &

ALIGN_LEFT="\\l"
ALIGN_RIGHT="\\r"
ALIGN_CENTER="\\c"

WS1_NAME="Main"
WS2_NAME="Background"
WS3_NAME="Code"
WS4_NAME="Graph"
WS5_NAME="Game"
WS6_NAME="Chrome"
WS7_NAME="Mail"

SM1_NAME="Web"
SM2_NAME="Extra"
SM3_NAME="Torrent"

# Do silently
silent() {
        $* > /dev/null && return 0 || return 1
}

# Print without line feed
show() {
        echo -n "$*"
}

# Show time stamp
timestamp() {
        show $ALIGN_RIGHT

        current_play=$(ncmpcpp --now-playing %a' - '%t)
        show "\\f4 $current_play"
        show " "

        show "\\f2$(date '+%A, %-e. %B') \\f1$(date +%H:%M)"
        show " "
}

# Show unselected workspace
unselected() {
        show "\\f1 $* "
}

# Show selected workspace
selected() {
        show "\\b1\\u1\\f3 $* \\br\\ur"
}

# Show workspaces
workspaces() {
        # Retrieve current desktop
        current_desktop=$(bspc query -D -d focused)
        # current_desktop=${current_desktop:8} # Remove prefix DVI-I-N- from desktop string

        show "$ALIGN_LEFT"

        # Check which desktop is selected
        [ "x$current_desktop" = "xDFP3-1" ] && selected $WS1_NAME || unselected $WS1_NAME
        [ "x$current_desktop" = "xDFP3-2" ] && selected $WS2_NAME || unselected $WS2_NAME
        [ "x$current_desktop" = "xDFP3-3" ] && selected $WS3_NAME || unselected $WS3_NAME
        [ "x$current_desktop" = "xDFP3-4" ] && selected $WS4_NAME || unselected $WS4_NAME
        [ "x$current_desktop" = "xDFP3-5" ] && selected $WS5_NAME || unselected $WS5_NAME
        [ "x$current_desktop" = "xDFP3-6" ] && selected $WS6_NAME || unselected $WS6_NAME
        [ "x$current_desktop" = "xDFP3-7" ] && selected $WS7_NAME || unselected $WS7_NAME


        [ "x$current_desktop" = "xCRT1-1" ] && selected $SM1_NAME || unselected $SM1_NAME
        [ "x$current_desktop" = "xCRT1-2" ] && selected $SM2_NAME || unselected $SM2_NAME
        [ "x$current_desktop" = "xCRT1-3" ] && selected $SM3_NAME || unselected $SM3_NAME
}

# Show windowtitles
windowtitle() {
        show $ALIGN_CENTER
        title=$(xtitle)
        show "\\f3${title:0:50}"
}

playing() {
    current_play=$(ncmpcpp --now-playing %a' - '%t)
    show $ALIGN_CENTER
    show "\\f4 $current_play"
}
cat $PANEL_FIFO | while read -r l; do
        workspaces
        windowtitle
#        playing
        timestamp
        echo
done | bar-aint-recursive -f 
