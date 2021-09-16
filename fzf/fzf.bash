# Setup fzf
# ---------
export PATH="$PATH:~/.fzf/linux-bin"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source ~/.fzf/fzf/shell/completion.bash 2> /dev/null

# Key bindings
# ------------
# source 中 ~ 用引号括起来是不行的
# source "~/.fzf/fzf/shell/key-bindings.bash"
# 以下两行都是可以的
# source "$HOME/.fzf/fzf/shell/key-bindings.bash"
source ~/.fzf/fzf/shell/key-bindings.bash

