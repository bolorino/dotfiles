#wallpaper.sh
WALLPAPERS="${HOME}/sync/wallpapers/"

feh --bg-scale "${WALLPAPERS}$(ls ${WALLPAPERS} | sort -R | head -1)"
