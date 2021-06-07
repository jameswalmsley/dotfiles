#!/usr/bin/env bash

# ssh-multi : a script to ssh multiple servers over multiple tmux panes
# nomad-fr : https://github.com/nomad-fr/scripts-systems
# Based on D.Kovalov work : https://gist.github.com/dmytro/3984680

# config
user=$USER # user use for ssh connection
#user=root
tmux_session_name="multi-ssh_$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 6)"
set -x

usage() {
    echo $1
    echo
    echo 'ssh-multi.sh : [OPTION]'
    echo '   -u user                           : user use for ssh connection : default "root"'
    echo '   -d "serv0 serv1 serv2 ... servN"  : list serv to connect to'
    echo
    echo '   Bonus:'
    echo '   -d "$(echo 'serv'{0..3})" : is the same as : -d "serv0 serv1 serv2 serv3"'
    echo '   -d "$(anotherscript)" : call a script that give a list of host separated by space'
    exit 0
}

starttmux() {
    local hosts=( $HOSTS )
    local windowname=$tmux_session_name
    tmux new-window -n "${windowname}" ssh $user@${hosts[0]}
    unset hosts[0];
    for i in "${hosts[@]}"
    do
        tmux split-window -t :"${windowname}" -h "ssh $user@$i"
        tmux select-layout -t :"${windowname}" tiled > /dev/null	
    done
    tmux select-pane -t 0
    tmux set-window-option -t :"${windowname}"  synchronize-panes on > /dev/null
}

checkopt() {
    if [ -z "$HOSTS" ]; then
	usage "Please provide of list of hosts with -d option."
    fi
    if [ -z "$TMUX" ]; then # if not in a tmux session create one
	# check that there is not an other session with same name
	compteur=0
	for session in $(tmux ls | awk '{print substr($1, 1, length($1)-1)}')
	do
	    ((compteur++))
	    if [ "$session" != "X" ]; then
		if [ "$session" = "$tmux_session_name" ]; then
		    tmux_session_name=$tmux_session_name"_"$compteur
		fi
	    fi
	done
	tmux -u new-session -d -s $tmux_session_name
	local launchtmux=1
    fi
    starttmux    
    if [ "$launchtmux" = 1 ]; then
	tmux a -dt $tmux_session_name
    fi
}

while getopts "u:d:h" o; do
        case "${o}" in
	    h)
		usage
		;;
	    u)
                user=${OPTARG}
                ;;
            d)
                HOSTS=${OPTARG}
                ;;
        esac
done
checkopt
