#!/bin/bash
echo 'Z' `ncmpcpp --now-playing %a' - '%t` > $PANEL_FIFO &
