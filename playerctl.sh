#!/usr/bin/env bash

CONFIG="$HOME/.config/polybar/config.ini"

playerctlstatus=$(playerctl status 2>/dev/null)
song=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

if [[ -z "$playerctlstatus" ]]; then
    echo ""
elif [[ "$playerctlstatus" =~ "Playing" ]]; then
    if [[ -z "$artist" ]]; then
        echo "%{A1:playerctl pause:} $song%{A}"
    else
        echo "%{A1:playerctl pause:} $artist - $song%{A}"
    fi
else
    echo "%{A1:playerctl play:} $artist - $song%{A}"
fi
