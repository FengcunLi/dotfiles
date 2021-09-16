# Setup fzf
# ---------

export PATH="$PATH:~/.fzf/linux-bin"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "~/.fzf/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "~/.fzf/fzf/shell/key-bindings.bash"
