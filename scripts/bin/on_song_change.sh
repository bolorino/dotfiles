#!/bin/bash
#echo 'Z' `ncmpcpp --now-playing %a' - '%t` > $PANEL_FIFO &
echo 'Z' `mpc current` > $PANEL_FIFO &
