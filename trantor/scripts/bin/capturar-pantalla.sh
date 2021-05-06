#!/bin/bash

scrot $HOME/'Imágenes/capturas/%Y-%m-%d_%H%M%S-$wx$h_scrot.png'
notify-send 'scrot' 'Captura tomada'
