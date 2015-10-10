#!/bin/bash
size=$1;
[[ -z "$1" ]] && size=13
printf '\33]50;%s%d\007' "xft:DejaVu Sans Mono:pixelsize=$size:antialias=true:hinting=true"
