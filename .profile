# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
#
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

export PATH="/usr/local/bin:$PATH"

export PATH="$(python3 -m site --user-base)/bin":$PATH

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/snap/bin" ] ; then
    export PATH="/snap/bin:$PATH"
fi

#export LC_ALL=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8
export LANG=en_GB.UTF-8

export EDITOR=nvim
export NVIM_LISTEN_ADDRESS=/tmp/nvim

if [ -d "$HOME/.local/arcanist/arcanist/bin" ] ; then
    PATH="$HOME/.local/arcanist/arcanist/bin:$PATH"
fi

if [ -d "$HOME/.local/git-subrepo" ] ; then
    source $HOME/.local/git-subrepo/.rc
fi

if [ -f "/usr/local/bin/sway" ] ; then
    source ~/.config/sway/sway-env.sh
fi

#
# Evaluate the go environment.
#

export PATH="$GOPATH/bin:$PATH"

# if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$KITTY_WINDOW_ID" ] || [ -n "$ALACRITTY_LOG" ] ; then
#     if [ -f "$(which fish)" ] ; then
#     	# export SHELL=fish
# 	if [ -f "$(which powerline-daemon)" ]; then
# 	    powerline-daemon -q
# 	fi
#     	exec fish
#     fi
# fi

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"



