#!/usr/bin/env bash

me="$(basename "$0")";
running=$(ps h -C "$me" | grep -wv $$ | wc -l);
[[ $running > 1 ]] && exit;

time=4

off=$(pamixer --get-volume-human | grep -o "muted" | head -n 1)

echo $1
echo $off

if [[ "$1" == "mute" || "$off" == *"off"* ]]
then
    echo `pamixer -t` > /dev/null
fi

if [[ "$1" == "lower" ]]
then
    echo `pamixer -d 5` > /dev/null
elif [[ "$1" == "raise" ]]
then
    echo `pamixer -i 5` > /dev/null
fi

vol=$(pamixer --get-volume | grep -Po "[0-9]+" | tail -1)
off=$(pamixer --get-volume-human | grep -o "muted" | head -n 1)

alpha="0.5"

if [[ "$1" == "mute" && "$off" == *"muted"* ]]
then
    avizo-client --image-resource="volume_muted" --progress="0" --time=$time --background="rgba(255, 255, 255, $alpha)"
else
    scaled=$(echo "scale=2; $vol / 100.0" | bc)
    echo $scaled

    if [ "$vol" -lt "34" ]
    then
        avizo-client --image-resource="volume_low" --progress=$scaled --time=$time --background="rgba(255, 255, 255, $alpha)"
    elif [ "$vol" -lt "67" ]
    then
        avizo-client --image-resource="volume_medium" --progress=$scaled --time=$time --background="rgba(255, 255, 255, $alpha)"
    elif [ "$vol" -lt "101" ]
    then
        avizo-client --image-resource="volume_high" --progress=$scaled --time=$time --background="rgba(255, 255, 255, $alpha)"
    fi
fi

