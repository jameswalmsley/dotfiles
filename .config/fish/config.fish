fish_hybrid_key_bindings

#set -x POWERLINE (pip3 show powerline-status | grep "Location*" | cut -d " " -f2 )

#if test -d $POWERLINE/powerline/bindings/fish
#	set fish_function_path $fish_function_path  "$POWERLINE/powerline/bindings/fish"
#	source $POWERLINE/powerline/bindings/fish/powerline-setup.fish
#	powerline-setup
#end

alias code="code-insiders --force-device-scale-factor=1.25"

alias cf="vim ~/.config/fish/config.fish"
alias swc="vim ~/.config/sway/config"

alias h="env GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.dot-files.git"

function hs
	h git status -uno
end

function h.omf
    curl -L https://get.oh-my.fish | fish
end

#alias nvim=nvr -s
alias vim=nvim

alias tm="tmux new-session -A -s main"

alias t.wc="kitty @ set-colors -a ~/.config/kitty/kitty-themes/themes/WildCherry.conf"
alias t.sl="kitty @ set-colors -a ~/.config/kitty/kitty-themes/themes/Solarized_Light.conf"
alias t.sd="kitty @ set-colors -a ~/.config/kitty/kitty-themes/themes/Solarized_Dark.conf"
alias t.at="kitty @ set-colors -a ~/.config/kitty/kitty-themes/themes/AdventureTime.conf"

alias gl="git log --graph --pretty=format:\"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\" --abbrev-commit"
