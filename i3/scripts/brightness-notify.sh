#!/bin/bash

BRIGHTNESS=$(brightnessctl i | grep -o '[0-9]\{1,3\}%')

case "$BRIGHTNESS" in
    [1-9]%|[1-2][0-9]%|3[0-3]%) ICON="display-brightness-low-symbolic";;
    [3-6][0-9]%|6[0-6]%) ICON="display-brightness-medium-symbolic";;
    [6-9][0-9]%|100%) ICON="display-brightness-high-symbolic";;
    *) ICON="display-brightness-off-symbolic";;
esac

notify-send -u low -t 1000 -h string:x-dunst-stack-tag:brightness -i "$ICON" "$BRIGHTNESS"

