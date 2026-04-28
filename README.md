# limb.tmux

tmux integration for [limb](https://github.com/ss0923/limb).

[![CI](https://github.com/ss0923/limb.tmux/actions/workflows/ci.yml/badge.svg)](https://github.com/ss0923/limb.tmux/actions/workflows/ci.yml)
[![License](https://img.shields.io/github/license/ss0923/limb.tmux)](#license)

Adds one key binding. `prefix + W` opens a popup worktree picker. If any
tmux window already has its current pane working directory set to the
selected worktree, focus that window. Otherwise, open a new window at
the selected path.

## Requirements

- tmux 3.2 or later. `display-popup` was added in 3.2.
- The `limb` binary on `$PATH`. See the
  [installation instructions](https://github.com/ss0923/limb#install).
- At least one entry in `projects.roots` of
  `~/.config/limb/config.toml`. Without configured roots, `limb pick`
  has nothing to enumerate.

## Installation

### [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

Add to `~/.config/tmux/tmux.conf`:

```tmux
set -g @plugin 'ss0923/limb.tmux'
run '~/.config/tmux/plugins/tpm/tpm'
```

Press `prefix + I` inside tmux to fetch and install.

### Manual

```sh
git clone https://github.com/ss0923/limb.tmux ~/.config/tmux/plugins/limb.tmux
```

Append to `~/.config/tmux/tmux.conf`:

```tmux
run-shell ~/.config/tmux/plugins/limb.tmux/limb.tmux
```

Reload with `tmux source-file ~/.config/tmux/tmux.conf`.

## Configuration

Set these options before the plugin loads:

```tmux
set -g @limb-pick-key   W    # default: W; opens picker with prefix + W
set -g @limb-pick-fetch on   # default: off; runs `git fetch` per repo before opening
```

`@limb-pick-fetch = on` runs `limb pick --fetch`, which refreshes every
repo's remote-tracking refs before opening the picker. Useful when you
keep the popup open all day and want ahead / behind counts that reflect
right now rather than the last time you fetched. Off by default because
the fetch can take a few seconds over slow links; pair with a
[background scheduler](https://limb.steele.dev/docs/commands/update#background-scheduling)
for hands-off freshness.

## Inside the picker

The popup runs the full `limb pick` TUI, so every key the binary
understands works inside the popup:

| key | action |
|---|---|
| `↑` `↓` or `j` `k` | move selection |
| `Enter` | confirm |
| `Esc` or `Ctrl-C` or `q` | cancel |
| `/` | fuzzy filter |
| `?` | help overlay |
| `r` | refresh the highlighted row's repo (`git fetch` + recompute) |
| `R` | refresh every visible repo |

The picker also shows a `FETCHED` column with the age of each repo's
last `git fetch`, color-coded by the thresholds in
[`[refresh.thresholds]`](https://limb.steele.dev/docs/configuration/refresh).
If the column ever drifts to red or dim, hit `R` to refresh in place.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Licensed under either of

- Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or
  <http://www.apache.org/licenses/LICENSE-2.0>)
- MIT license ([LICENSE-MIT](LICENSE-MIT) or <http://opensource.org/licenses/MIT>)

at your option.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally
submitted for inclusion in the work by you, as defined in the Apache-2.0
license, shall be dual licensed as above, without any additional terms or
conditions.
