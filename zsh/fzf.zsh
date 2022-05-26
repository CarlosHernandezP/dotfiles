# Setup fzf
# ---------
if [[ ! "$PATH" == */home/carlos/dotfiles/nvim/plugged/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/carlos/dotfiles/nvim/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/carlos/dotfiles/nvim/plugged/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
#source "/home/carlos/dotfiles/nvim/plugged/fzf/shell/key-bindings.zsh"
