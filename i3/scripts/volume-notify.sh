#!/bin/bash

VOLUME=$(pamixer --get-volume)

if [[ $(pamixer --get-mute) == true ]]; then
    ICON="audio-volume-muted-symbolic"
    TEXT="Muted ($VOLUME%)"
else
    ICON="audio-volume-muted-blocking-symbolic"
    case "$VOLUME" in
        [0-9]|[1-2][0-9]|3[0-3]) ICON="audio-volume-low-symbolic";;
        [3-6][0-9]|6[0-6]) ICON="audio-volume-medium-symbolic";;
        [6-9][0-9]|100) ICON="audio-volume-high-symbolic";;
        [1-9][0-9][0-9]*) ICON="audio-volume-overamplified-symbolic";;
    esac
    TEXT="$VOLUME%"
fi

notify-send -u low -t 1000 -h string:x-dunst-stack-tag:volume -i "$ICON" "$TEXT"
