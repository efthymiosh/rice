#!/bin/bash
EXT_HORI=2560
EXT_VERT=1440
xrandr --output eDP-1 --pos $(( (${EXT_HORI} - 1920) / 2 ))x${EXT_VERT} --output DP-1 --mode ${EXT_HORI}x${EXT_VERT} --pos 0x0
