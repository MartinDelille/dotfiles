#!/usr/bin/env bash
languages=$(echo "cpp lua python typescript nodejs css" | tr ' ' '\n')
core_utils=$(echo "tmux sed make git lsof conan grep" | tr ' ' '\n')
selected=$(printf "$languages\n$core_utils" | fzf)
if [ "$selected" ]; then
  echo "selection is $selected"
  read -p "query: " query

  if printf $languages | grep -qs $selected; then
    url=cht.sh/$selected/$(echo $query | tr ' ' '+')
  else
    url=cht.sh/$selected~$query
  fi

  echo $url
  cmd="curl -s $url & while [ : ]; do sleep 1; done"
else
  echo "No selection made. Exiting: $0"
  cmd="nvim $0"
fi
tmux neww bash -c "$cmd"
