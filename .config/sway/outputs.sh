#!/bin/bash

HOME_OFFICE=$(swaymsg -t get_outputs -p | grep Goldstar)

echo $HOME_OFFICE

if [ -n "$HOME_OFFICE" ]; then
echo Configuring home office monitors.
swaymsg output eDP-1 resolution 2560x1440 position \'0,0\' enable
swaymsg output DP-4 resolution 3840x2160 position \'2560,0\' enable

else

echo Configuring GC Office Monitors.

swaymsg output eDP-1 resolution 1920x1080 position \'3840,0\'
swaymsg output HDMI-A-1 disable
swaymsg output DP-4 disable

swaymsg output HDMI-A-1 resolution 3840x2160 position \'0,0\' enable



fi

