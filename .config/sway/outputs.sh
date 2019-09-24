#!/bin/bash

HOME_OFFICE=$(swaymsg -t get_outputs -p | grep Goldstar)

echo $HOME_OFFICE

if [ -n "$HOME_OFFICE" ]; then

	if [ -n "$(swaymsg -t get_outputs -p | grep 'Unknown 0x0792')" ]; then
		echo P1-Laptop - Configuring home office monitors
		swaymsg output \"Goldstar Company Ltd LG Ultra HD 0x0000661B\" resolution 3840x2160 position \'0,0\' enable
		swaymsg output eDP-1 resolution 1920x1080 position \'3840,0\' enable
	else

	
		echo Carbon-Laptop - Configuring home office monitors
		swaymsg output eDP-1 resolution 2560x1440 position \'0,0\' enable
		swaymsg output DP-4 resolution 3840x2160 position \'2560,0\' enable

	fi


else

echo Configuring GC Office Monitors.

swaymsg output \'Samsung Electric Company S27H85x H4ZM303519\' resolution 2560x1440 position \'0,0\'
swaymsg output \'Samsung Electric Company S27H85x H4ZKC00773\' resolution 2560x1440 position \'2560,0\'
swaymsg output eDP-1 resolution 1920x1080 position \'5120,0\'


fi

