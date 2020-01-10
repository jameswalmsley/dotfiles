#!/bin/bash

export PATH="/snap/bin/:/var/lib/snapd/desktop:$PATH"

#rofi -combi-modi window,drun,run -show combi -modi combi

SCREEN_POS=$(swaymsg -t get_outputs \
	| jq -r \
	'.[] | select(.focused).rect | "\(.width)x\(.height)\\+\(.x)\\+\(.y)"')

echo $SCREEN_POS
POSX=$(echo $SCREEN_POS | cut -d + -f2 | cut -d \\ -f1)
echo $POSX
POSY=$(echo $SCREEN_POS | cut -d + -f3)
echo $POSY

# GNU grep
XWAYLAND_OUTPUT=$(xrandr | grep -oP "[A-Z]+[0-9]+(?= connected $POS)")

OUTPUT=$(xrandr | grep -oP "[A-Z]+[0-9]+(?= connected [0-9]+x[0-9]+\+$POSX\+$POSY)")
echo $OUTPUT

MONITOR_ID=$(rofi --help | grep $OUTPUT -B1 \
	| sed -sr '/ID/!d;s/[^:]*:\s([0-9])/\1/')

# stdin for dmenu mode
rofi -m $MONITOR_ID -combi-modi window,drun,run -show combi -modi combi </dev/stdin

