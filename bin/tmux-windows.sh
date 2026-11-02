#!/usr/bin/env bash
# fzf window switcher: index, name, working directory and git branch of the active pane
windows=$(tmux list-windows -F $'#{window_active}\t#{window_index}\t#{window_name}\t#{pane_current_path}')
# row of the current window, to preselect it
current=$(awk -F'\t' '$1 == 1 { print NR; exit }' <<<"$windows")

while IFS=$'\t' read -r _ index name path; do
  branch=$(git -C "$path" branch --show-current 2>/dev/null)
  [ -z "$branch" ] && branch=$(git -C "$path" rev-parse --short HEAD 2>/dev/null)
  printf '%s\t%s\t\033[34m%s\033[0m\t\033[32m%s\033[0m\n' \
    "$index" "$name" "${path/#"$HOME"/\~}" "$branch"
done <<<"$windows" |
  column -t -s $'\t' |
  fzf --ansi --layout=reverse --border --prompt="window> " --bind "load:pos(${current:-1}),change:first" |
  awk '{print $1}' |
  xargs -r tmux select-window -t
