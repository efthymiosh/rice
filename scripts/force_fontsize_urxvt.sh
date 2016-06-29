#!/bin/bash
size=$1;
[[ -z "$1" ]] && size=13
printf '\33]710;%s\007' "xft:DejaVu Sans Mono:pixelsize=$size:antialias=true:hinting=true"
printf '\33]711;%s\007' "xft:DejaVu Sans Mono:pixelsize=$size:antialias=true:hinting=true"
printf '\33]712;%s\007' "xft:DejaVu Sans Mono:pixelsize=$size:antialias=true:hinting=true"
printf '\33]713;%s\007' "xft:DejaVu Sans Mono:pixelsize=$size:antialias=true:hinting=true"
