#!/bin/bash

color_accent='#{{ theme.accent }}'
color_bg='#{{ theme.background }}'
color_urgent='#{{ theme.bright.red }}'

function kill_wait {
    killall -q "$1"
    while pgrep -x "$1" >/dev/null; do sleep 0.2; done
}

autorandr --change

setxkbmap us
kill_wait compton
kill_wait polybar
compton &
nitrogen --restore &

herbstclient emit_hook reload

xset r rate 350 33
xset s off
xset -dpms

herbstclient keyunbind --all

# Keybindings
Mod=Mod4 # super key

herbstclient keybind $Mod-Shift-q quit
herbstclient keybind $Mod-Shift-r reload
herbstclient keybind $Mod-Shift-c close
herbstclient keybind $Mod-Return spawn alacritty
herbstclient keybind $Mod-Alt-l spawn i3lock-fancy

# Launcher
herbstclient keybind $Mod-d spawn rofi -show run
herbstclient keybind $Mod-a spawn rofi -show drun
herbstclient keybind XF86Search spawn rofi -show drun

# Screenshot
herbstclient keybind Print spawn scrot 

# Keyboard locale
setxkbmap -option grp:win_space_toggle us,el

# Sound
herbstclient keybind XF86AudioRaiseVolume spawn amixer -D pulse sset Master 5%+
herbstclient keybind XF86AudioLowerVolume spawn amixer -D pulse sset Master 5%-
herbstclient keybind XF86AudioMute spawn amixer -D pulse sset Master 1+ toggle

herbstclient keybind $Mod-equal spawn amixer -D pulse sset Master 5%+
herbstclient keybind $Mod-minus spawn amixer -D pulse sset Master 5%-

# Brightness
herbstclient keybind XF86MonBrightnessUp spawn xbacklight -inc 10
herbstclient keybind XF86MonBrightnessDown spawn xbacklight -dec 10

# basic movement
# focusing clients
herbstclient keybind $Mod-h     focus left
herbstclient keybind $Mod-j     focus down
herbstclient keybind $Mod-k     focus up
herbstclient keybind $Mod-l     focus right

# moving clients
herbstclient keybind $Mod-Shift-h     shift left
herbstclient keybind $Mod-Shift-j     shift down
herbstclient keybind $Mod-Shift-k     shift up
herbstclient keybind $Mod-Shift-l     shift right

# splitting frames
# create an empty frame at the specified direction
herbstclient keybind $Mod-u       split   bottom  0.5
herbstclient keybind $Mod-o       split   right   0.5
herbstclient keybind $Mod-Shift-o split   right   0.67
herbstclient keybind $Mod-Shift-i split   right   0.33

# let the current frame explode into subframes
herbstclient keybind $Mod-Control-space split explode

# resizing frames
resizestep=0.025
herbstclient keybind $Mod-Control-h       resize left +$resizestep
herbstclient keybind $Mod-Control-j       resize down +$resizestep
herbstclient keybind $Mod-Control-k       resize up +$resizestep
herbstclient keybind $Mod-Control-l       resize right +$resizestep

herbstclient keybind $Mod-w            set_attr theme.active.color $color_accent
herbstclient keybind $Mod-Shift-w      set_attr theme.active.color $color_bg

herbstclient set_layout max
herbstclient set default_frame_layout 2

# tags
tag_names=( 'main' 'work' 'lab' 'comms' )
tag_keys=( {1..4} 0 )

herbstclient rename default "${tag_names[0]}" || true
for i in ${!tag_names[@]} ; do
    herbstclient add "${tag_names[$i]}"
    key="${tag_keys[$i]}"
    if ! [ -z "$key" ] ; then
        herbstclient keybind "$Mod-$key" use_index "$i"
        herbstclient keybind "$Mod-Shift-$key" move_index "$i"
    fi
done

# cycle through tags
herbstclient keybind $Mod-period use_index +1 --skip-visible
herbstclient keybind $Mod-comma  use_index -1 --skip-visible

# layouting
herbstclient keybind $Mod-r remove
herbstclient keybind $Mod-Shift-space cycle_layout 1
herbstclient keybind $Mod-s floating toggle
herbstclient keybind $Mod-f fullscreen toggle
herbstclient keybind $Mod-p pseudotile toggle

# mouse
herbstclient mouseunbind --all
herbstclient mousebind $Mod-Button1 move
herbstclient mousebind $Mod-Button2 zoom
herbstclient mousebind $Mod-Button3 resize

# focus
herbstclient keybind $Mod-BackSpace   cycle_monitor
herbstclient keybind $Mod-Tab         cycle_all +1
herbstclient keybind $Mod-Shift-Tab   cycle_all -1
herbstclient keybind $Mod-c cycle
herbstclient keybind $Mod-i jumpto urgent

# theme
herbstclient attr theme.tiling.reset 1
herbstclient attr theme.floating.reset 1
herbstclient set frame_border_width 0
herbstclient set always_show_frame 0
herbstclient set frame_bg_transparent 1
herbstclient set frame_normal_opacity 0
herbstclient set frame_active_opacity 0
herbstclient set frame_transparent_width 0
herbstclient set frame_padding 0
herbstclient set frame_gap 16

herbstclient set window_gap 0
herbstclient set smart_window_surroundings 0
herbstclient set smart_frame_surroundings 0
herbstclient set mouse_recenter_gap 0

herbstclient attr theme.active.color $color_bg
herbstclient attr theme.normal.color $color_bg
herbstclient attr theme.urgent.color $color_urgent
herbstclient attr theme.inner_width 1
herbstclient attr theme.inner_color $color_bg
herbstclient attr theme.border_width 4
herbstclient attr theme.floating.border_width 4
herbstclient attr theme.floating.outer_width 1
herbstclient attr theme.floating.outer_color $color_bg
herbstclient attr theme.active.inner_color $color_bg
herbstclient attr theme.active.outer_color $color_bg
herbstclient attr theme.background_color $color_bg

# rules
herbstclient unrule -F
herbstclient rule focus=on # normally focus new clients
herbstclient rule windowtype~'_NET_WM_WINDOW_TYPE_(DIALOG|UTILITY|SPLASH)' pseudotile=on
herbstclient rule windowtype='_NET_WM_WINDOW_TYPE_DIALOG' focus=on
herbstclient rule windowtype~'_NET_WM_WINDOW_TYPE_(NOTIFICATION|DOCK|DESKTOP)' manage=off

# unlock, just to be sure
herbstclient unlock

herbstclient set tree_style '╾│ ├└╼─┐'

# do multi monitor setup here, e.g.:
# herbstclient set_monitors 1280x1024+0+0 1280x1024+1280+0
# or simply:
herbstclient detect_monitors

panel_padding=32
for monitor in $(herbstclient list_monitors | cut -d: -f1) ; do
    herbstclient pad $monitor $panel_padding
done

# find the panel
panel=~/.config/polybar/panel.sh

"$panel" &
