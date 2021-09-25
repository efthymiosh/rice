#!/usr/bin/env sh

# start polybar on the primary monitor
export MONITOR=$(polybar -m | grep -ie "primary" | cut -d: -f1)
export TRAY_POS="right"
polybar -q leftie &
polybar -q rightie &


export TRAY_POS="none"
for monitor in $(polybar -m | grep -v "primary" | cut -d: -f1) ; do
    export MONITOR="$monitor"
    polybar -q leftie &
    polybar -q rightie &
done
