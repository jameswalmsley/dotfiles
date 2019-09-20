#!/bin/sh

filename=$(xdg-user-dir PICTURES)/$(date +'%Y-%m-%d-%H%M%S_grim.png')
grim -g "$(slurp)" $filename

