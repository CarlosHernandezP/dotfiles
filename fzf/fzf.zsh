# Setup fzf
# ---------
if [[ ! "$PATH" == */home/sarios/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/sarios/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/sarios/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source ~/.fzf/shell/key-bindings.zsh


export FZF_DEFAULT_COMMAND='fdfind --type f --color=never'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview="bat {} --theme="base16" --color=always --style=\"numbers\""'

# Like default commant, but with directories instead of files
export FZF_ALT_C_COMMAND='fdfind --type d . --color=never'
export FZF_ALT_C_OPTS='--preview="exa {} -l --color=always"'

# Alt+c: search all files from current directory
export FZF_ALT_D_COMMAND='fdfind --type d . --color=always'
export FZF_ALT_D_OPTS='--preview="exa {} -l --color=always"'

FZF_TAB_COMMAND=(
    fzf
    --height=40%
    --ansi   # Enable ANSI color support, necessary for showing groups
    --expect='$continuous_trigger' # For continuous completion
    '--color=hl:$(( $#headers == 0 ? 108 : 255 ))'
    --nth=2,3 --delimiter='\x00'  # Don't search prefix
    --layout=reverse
    --tiebreak=begin -m --bind=tab:down,change:top,ctrl-s:toggle --cycle
    '--query=$query'   # $query will be expanded to query string at runtime.
    '--header-lines=$#headers' # $#headers will be expanded to lines of headers at runtime
)
