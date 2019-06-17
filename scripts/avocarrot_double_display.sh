#!/bin/bash
EXT_HORI=2560
EXT_VERT=1440
xrandr --output eDP-1 --pos 0x${EXT_VERT}\
    --output DP-1-1 --mode ${EXT_HORI}x${EXT_VERT} --pos $(( - ${EXT_HORI} / 2 ))x0\
    --output DP-1-2 --mode ${EXT_HORI}x${EXT_VERT} --pos $(( ${EXT_HORI} / 2 ))x0
