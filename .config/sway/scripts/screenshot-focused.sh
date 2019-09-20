#!/bin/sh

filename=$(xdg-user-dir PICTURES)/$(date +'%Y-%m-%d-%H%M%S_grim.png')
grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') $filename

