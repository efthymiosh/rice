#!/bin/bash

# xrandr --newmode "2560x1440_30.00"  146.25  2560 2680 2944 3328  1440 1443 1448 1468 -hsync +vsync
# xrandr --addmode HDMI1 "2560x1440_30.00"
# xrandr --output HDMI1 --mode "2560x1440_30.00"

xrandr --newmode "2560x1440_30.00_rb"  119.00  2560 2608 2640 2720  1440 1443 1448 1461  +HSync -Vsync
xrandr --addmode HDMI1 2560x1440_30.00_rb
xrandr --output eDP1 --off
xrandr --output HDMI1 --mode "2560x1440_30.00_rb" 
