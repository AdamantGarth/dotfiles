#!/bin/bash

declare -A LAYOUTS=( ['us']=0 ['ru']=1 ['ua']=2 )

# Remember current keyboard layout
LAYOUT="$(akd -c)"
echo "DEBUG: Return code $?, layout $LAYOUT" > /tmp/lock.log

# Set latin keyboard layout for password entry
akd -i 0

# Lock the screen
i3lock -n -i ~/Pictures/Wallpapers/Win10.png -p win

# Restore previous keyboard layout
[ ! -z "$LAYOUT" ] && akd -i "${LAYOUTS[$LAYOUT]}"
