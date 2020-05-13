fish_hybrid_key_bindings

set -x POWERLINE (pip3 show powerline-status | grep "Location*" | cut -d " " -f2 )

if test -d $POWERLINE/powerline/bindings/fish
	set fish_function_path $fish_function_path  "$POWERLINE/powerline/bindings/fish"
	source $POWERLINE/powerline/bindings/fish/powerline-setup.fish
	powerline-setup
end

alias code="code-insiders --force-device-scale-factor=1.25"

alias cf="vim ~/.config/fish/config.fish"
alias swc="vim ~/.config/sway/config"

alias h="env GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.dot-files.git"

function hs
	h git status -uno
end

alias tmux="tmux -2 attach"

set -l nvimvar (which nvim)
if test -z "$nvimvar"

else
    alias vim="nvim"
end

fish_hybrid_key_bindings

