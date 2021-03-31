#!/bin/bash
NVCODE_BASE="/usr/local/share/nvcode"
NVCODE_USER="$HOME/.local/share/nvcode"

eval_environment() {
	export SHELL=/bin/bash
	NVCODE_CONFIG=${NVCODE_BASE}/nvim/init.lua
	export XDG_CONFIG_HOME="$HOME/.config/nvcode"
	export XDG_DATA_HOME="${NVCODE_USER}/data"	
	export XDG_CACHE_HOME="${NVCODE_USER}/cache"
	export XDG_CONFIG_DIRS="/usr/share:/usr/local/share:/usr/local/share/nvcode"
}

user_environment() {
	if [[ -f "${HOME}/.config/nvcode/init.lua" ]]; then
		echo file
    	NVCODE_BASE="${HOME}/.config/nvcode"
	fi

	eval_environment
}

eval_environment

