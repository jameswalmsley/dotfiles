#!/bin/bash

set -ex

state=$(playerctl status)

if [[ "$state" == "Playing" ]]
then
    playerctl pause
fi

if [[ "$state" == "Paused" ]]
then
    playerctl play
fi
