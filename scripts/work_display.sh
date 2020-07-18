#!/bin/bash
EXT_HORI=2560
EXT_VERT=1440
OUTPUT=HDMI-1
xrandr --output eDP-1 --pos $(( (${EXT_HORI} - 1920) / 2 ))x${EXT_VERT} --output $OUTPUT --mode ${EXT_HORI}x${EXT_VERT} --pos 0x0
