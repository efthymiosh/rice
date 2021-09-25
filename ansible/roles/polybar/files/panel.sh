#!/bin/bash

function spawn_polybar {
    export MONITOR="$(echo $1 | cut -d: -f1)"
    WIDTH="$(echo $1 | sed 's/^.*:\ \([0-9]\+\)x.*$/\1/')"

    if [ "$WIDTH" -lt 2560 ]; then
        polybar -q full &
    else
        polybar -q leftie &
        polybar -q rightie &
    fi
}

# start polybar on the primary monitor
export TRAY_POS="right"
spawn_polybar "$(polybar -m | grep 'primary')"

export TRAY_POS="none"
polybar -m | grep -v 'primary' | while read ENTRY ; do
    spawn_polybar "$ENTRY"
done
