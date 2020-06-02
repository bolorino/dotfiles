#wallpaper.sh
WALLPAPERS="${HOME}/Imágenes/wallpapers/Desktop/"

feh --bg-scale "${WALLPAPERS}$(ls ${WALLPAPERS} | sort -R | head -1)"
