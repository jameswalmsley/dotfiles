if test -d ~/.local/lib/python3.6/site-packages/powerline/bindings/fish
	set fish_function_path $fish_function_path  "~/.local/lib/python3.6/site-packages/powerline/bindings/fish"
	source ~/.local/lib/python3.6/site-packages/powerline/bindings/fish/powerline-setup.fish
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

fish_vi_key_bindings

