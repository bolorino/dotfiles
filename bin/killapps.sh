#!/bin/bash
# Kill additional apps on exit

# Background apps
apps=( compton dropboxd ubuntuone-launch )

for app in "${apps[@]}"
do
    if [ "$(pidof $app)" ]; then
        kill -TERM `echo "$(pidof $app)"`
    fi
done
