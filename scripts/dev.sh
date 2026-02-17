/usr/bin/env bash

set -euo pipefail

selected=$PWD
selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux || true)

setup_panes() {
  local session=$1
  local window=$2
  local dir=$3

  # split top/bottom
  tmux split-window -v -c "$dir" -t "$session:$window"
  # go to top pane, split left/right
  tmux select-pane -t "$session:$window.0"
  tmux split-window -h -c "$dir" -t "$session:$window"

  # pane 0 = top-left, pane 1 = top-right, pane 2 = bottom
  tmux send-keys -t "$session:$window.0" 'nvim' C-m
  # Using nvim opencode we can start opencode from inside nvim in a tmux pane
  # tmux send-keys -t "$session:$window.1" 'opencode' C-m

  # bottom pane ~30% height (top panes get ~70%)
  tmux resize-pane -t "$session:$window.2" -y '30%'

  # opencode pane ~40% width (nvim gets ~60%)
  tmux resize-pane -t "$session:$window.1" -x '40%'

  # focus nvim pane
  tmux select-pane -t "$session:$window.0"
}

# tmux not running at all
if [[ -z ${TMUX:-} ]] && [[ -z $tmux_running ]]; then
  tmux new-session -ds "$selected_name" -c "$selected"
  sleep 0.1
  setup_panes "$selected_name" 0 "$selected"
  tmux attach-session -t "$selected_name"
  exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
  # session doesn't exist — create it with the layout
  tmux new-session -ds "$selected_name" -c "$selected"
  sleep 0.1
  setup_panes "$selected_name" 0 "$selected"
else
  # session exists — create a new window with the layout
  window=$(tmux new-window -t "$selected_name" -c "$selected" -P -F '#{window_index}')
  window_index="${window##*:}"
  setup_panes "$selected_name" "$window_index" "$selected"
fi

# attach or switch
if [[ -z ${TMUX:-} ]]; then
  tmux attach-session -t "$selected_name"
else
  tmux switch-client -t "$selected_name"
fi
