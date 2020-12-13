#!/bin/bash

set -eu
# get data either form stdin or from file
buf=$(cat "$@")
# Get buffer length
buflen=$( printf %s "$buf" | wc -c )
maxlen=74994

# warn if exceeds maxlen

if [ "$buflen" -gt "$maxlen" ];
then
  printf "input is %d bytes too long" "$(( buflen - maxlen ))" >&2
fi

# build up OSC 52 ANSI escape
sequenceesc="\033]52;c;$( printf %s "$buf" | head -c $maxlen | base64 | tr -d '\r\n' )\a"
esc="\033Ptmux;\033$esc\033\\"
pane_active_tty=$(tmux list-panes -F "#{pane_active} #{pane_tty}" | awk '$1=="1" { print $2 }')
printf "$esc" > "$pane_active_tty"



