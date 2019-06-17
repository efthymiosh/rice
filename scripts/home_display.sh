#!/bin/bash
EXT_HORI=3440
EXT_VERT=1440
OUTPUT=DP-1
xrandr --output eDP-1 --off --output $OUTPUT --mode ${EXT_HORI}x${EXT_VERT}
