#!/bin/bash

swaymsg output eDP-1 resolution 1920x1080 position \'3840,0\'
swaymsg output HDMI-A-1 disable
swaymsg output DP-4 disable

swaymsg output HDMI-A-1 resolution 3840x2160 position \'0,0\' enable
