#!/usr/bin/env bash
set -euo pipefail

if ! command -v limb >/dev/null 2>&1; then
    echo "limb not found on PATH. Install: https://github.com/ss0923/limb" >&2
    read -rp "press Enter to close"
    exit 1
fi

path="$(limb pick)" || exit 0
[[ -z "$path" ]] && exit 0

target="$(cd "$path" && pwd -P)"
existing=""
while IFS='|' read -r id current_path; do
    resolved="$(cd "$current_path" 2>/dev/null && pwd -P)" || continue
    if [[ "$resolved" == "$target" ]]; then
        existing="$id"
        break
    fi
done < <(tmux list-windows -a -F '#{window_id}|#{pane_current_path}')

if [[ -n "$existing" ]]; then
    tmux select-window -t "$existing"
else
    tmux new-window -c "$path" -n "$(basename "$path")"
fi
