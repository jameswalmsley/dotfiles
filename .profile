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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/snap/bin" ] ; then
    PATH="/snap/bin:$PATH"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [ -d "$HOME/.local/kitty.app/bin" ] ; then
    export KITTY_DISABLE_WAYLAND=1
    PATH="$HOME/.local/kitty.app/bin:$PATH"
fi

export EDITOR=vim

if [ -d "$HOME/.local/arcanist/arcanist/bin" ] ; then
    PATH="$HOME/.local/arcanist/arcanist/bin:$PATH"
fi

if [ -d "$HOME/.local/git-subrepo" ] ; then
    source $HOME/.local/git-subrepo/.rc
fi

export VIMINIT="source ~/.config/vim/vimrc"
export MYVIMRC="~/.config/vim/vimrc"

source ~/.config/sway/sway-env.sh

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$KITTY_WINDOW_ID" ] ; then
    if [ -f "/usr/local/bin/fish" ] ; then
    	SHELL=fish
	powerline-daemon -q
    	exec fish
    fi
fi

