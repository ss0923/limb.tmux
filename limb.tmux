#!/usr/bin/env bash
set -euo pipefail

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

KEY="$(tmux show-option -gqv "@limb-pick-key")"
KEY="${KEY:-W}"

tmux bind-key "$KEY" display-popup -E -w 90% -h 90% \
    -d "#{pane_current_path}" \
    "$CURRENT_DIR/scripts/pick.sh"
