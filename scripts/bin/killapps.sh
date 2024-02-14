#!/bin/bash
# Kill additional apps on exit

# Background apps
apps=( picom nextcloud owncloud single-panel.sh blueman-tray )

for app in "${apps[@]}"
do
    if [ "$(pidof $app)" ]; then
        kill -TERM `echo "$(pidof $app)"`
    fi
done
