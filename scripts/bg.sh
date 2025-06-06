#!/bin/bash

_screen() {
    nice -n 19 xwinwrap -ni -fs -s -ov -g $1 -- mpv --fullscreen\
        --on-all-workspaces \
        --no-stop-screensaver \
        --loop-file --no-audio --no-osc --no-osd-bar -wid WID --quiet \
        "$2" --background="$3" --video-zoom="$4" &
}

killall xwinwrap

sleep 0.5

for i in $( xrandr -q | grep ' connected' | grep -oP '\d+x\d+\+\d+\+\d+')
do
    _screen $i "$1" "${2:-none}" "${3:-0}"
done
