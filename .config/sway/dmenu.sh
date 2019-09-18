#!/bin/bash

export PATH="/snap/bin/:/var/lib/snapd/desktop:$PATH"

#rofi -combi-modi window,drun,run -show combi -modi combi

SCREEN_POS=$(swaymsg -t get_outputs \
	| jq -r \
	'.[] | select(.focused).rect | "\(.width)x\(.height)\\+\(.x)\\+\(.y)"')

# GNU grep
XWAYLAND_OUTPUT=$(xrandr | grep -oP "[A-Z]+[0-9]+(?= connected $SCREEN_POS)")

MONITOR_ID=$(rofi --help | grep $XWAYLAND_OUTPUT -B1 \
	| sed -sr '/ID/!d;s/[^:]*:\s([0-9])/\1/')

# stdin for dmenu mode
rofi -m $MONITOR_ID -combi-modi window,drun,run -show combi -modi combi </dev/stdin

