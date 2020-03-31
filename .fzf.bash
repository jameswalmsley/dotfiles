# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jamesw/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jamesw/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jamesw/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/jamesw/.fzf/shell/key-bindings.bash"
