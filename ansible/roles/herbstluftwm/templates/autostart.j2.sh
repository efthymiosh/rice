#!/bin/bash

color_accent='#{{ theme.accent }}'
color_bg='#{{ theme.background }}'
color_urgent='#{{ theme.bright.red }}'

function kill_wait {
    for program in "$@"; do
        killall -q "$program"
    done
    for program in "@"; do
        while pgrep -x "$program" >/dev/null; do sleep 0.01; done
    done
}

kill_wait polybar picom

herbstclient emit_hook reload

nitrogen --restore &
picom --experimental-backends &

( # X config
setxkbmap us
xset r rate 350 33
xset s off
xset -dpms
setxkbmap us,el -option "" -option grp:alt_space_toggle
) &


# keybinds
Mod=Mod4 # super key
herbstclient keyunbind --all

herbstclient keybind $Mod-Shift-q quit
herbstclient keybind $Mod-Shift-r reload
herbstclient keybind $Mod-Shift-c close
{% if default_multiplexer_screen %}
herbstclient keybind $Mod-Return spawn alacritty -e {{ default_shell }} -c 'screen -r || screen'
{% else %}
herbstclient keybind $Mod-Return spawn alacritty -e {{ default_shell }} -c 'tmux attach || tmux'
{% endif %}
herbstclient keybind $Mod-Alt-l spawn i3lock-fancy

herbstclient keybind XF86Search spawn rofi -modi combi -show combi
herbstclient keybind $Mod-d     spawn rofi -modi combi -show combi
herbstclient keybind $Mod-Tab   spawn rofi -modi window -show window -kb-row-down 'Super+Tab' -kb-accept-entry '!Super+Tab'

herbstclient keybind Print spawn bash -c 'maim -s | tee ~/screen-$(date +%Y%b%d.%H:%M:%S).png | xclip -t image/png -selection clipboard -i'
herbstclient keybind $Mod-p spawn bash -c 'maim -s | xclip -t image/png -selection clipboard -i'

herbstclient keybind XF86AudioRaiseVolume spawn amixer -D pulse sset Master 5%+
herbstclient keybind XF86AudioLowerVolume spawn amixer -D pulse sset Master 5%-
herbstclient keybind XF86AudioMute spawn amixer -D pulse sset Master 1+ toggle

herbstclient keybind $Mod-equal spawn amixer -D pulse sset Master 5%+
herbstclient keybind $Mod-minus spawn amixer -D pulse sset Master 5%-

# Brightness
herbstclient keybind XF86MonBrightnessUp spawn brightnessctl s +10%
herbstclient keybind XF86MonBrightnessDown spawn brightnessctl s 10%-

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
herbstclient keybind $Mod-Shift-u split   bottom  0.66
herbstclient keybind $Mod-o       split   right   0.5
herbstclient keybind $Mod-Shift-o split   right   0.67
herbstclient keybind $Mod-Shift-i split   right   0.33

# let the current frame explode into subframes
herbstclient keybind $Mod-space split explode

# resizing frames
resizestep=0.025
herbstclient keybind $Mod-Control-h       resize left +$resizestep
herbstclient keybind $Mod-Control-j       resize down +$resizestep
herbstclient keybind $Mod-Control-k       resize up +$resizestep
herbstclient keybind $Mod-Control-l       resize right +$resizestep


herbstclient set_layout max
herbstclient set default_frame_layout 2

# tags
tag_names=( '➕' '➖' '✖' '➗' )
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
herbstclient keybind $Mod-Shift-s floating toggle
herbstclient keybind $Mod-f fullscreen toggle
herbstclient keybind $Mod-Shift-p pseudotile toggle
herbstclient keybind $Mod-s set_attr clients.focus.floating toggle
herbstclient keybind $Mod-Shift-m set_attr clients.focus.minimized true

# mouse
herbstclient mouseunbind --all
herbstclient mousebind $Mod-Button1 move
herbstclient mousebind $Mod-Button2 zoom
herbstclient mousebind $Mod-Button3 resize

# focus
herbstclient keybind $Mod-BackSpace   cycle_monitor
herbstclient keybind $Mod-c           cycle
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
herbstclient rule floatplacement=center
herbstclient rule windowtype~'_NET_WM_WINDOW_TYPE_(DIALOG|UTILITY|SPLASH)' pseudotile=on
herbstclient rule windowtype='_NET_WM_WINDOW_TYPE_DIALOG' focus=on
herbstclient rule windowtype~'_NET_WM_WINDOW_TYPE_(NOTIFICATION|DOCK|DESKTOP)' manage=off
herbstclient rule class~'zoom.*' floating=on

# unlock, just to be sure
herbstclient unlock

herbstclient set tree_style '╾│ ├└╼─┐'

# do multi monitor setup here, e.g.:
# herbstclient set_monitors 1280x1024+0+0 1280x1024+1280+0
# or simply:
herbstclient detect_monitors

# find the panel
panel=~/.config/polybar/panel.sh

"$panel" &
