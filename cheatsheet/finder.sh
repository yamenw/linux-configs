pick_command() {
  local command
  command=$(awk -F ',' 'NR>1 {print $1 " " $2}' $HOME/sandbox/commands.csv | fzf --with-nth=1 --preview 'echo {2..}' --preview-window="wrap,bottom:4" | cut -d " " -f1)

  if [ -n "$command" ]; then
    local selected_command=$(awk -F ',' -v title="$(echo "$command" | cut -f1)" '$1 == title {print $3}' commands.csv)
    READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected_command${READLINE_LINE:$READLINE_POINT}"
    READLINE_POINT=$((READLINE_POINT + ${#selected_command}))
  fi
}

bind -x '"\C-x\C-c": pick_command'
