# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.0](https://github.com/ss0923/limb.tmux/releases/tag/v0.2.0) - 2026-04-28

### Added

- `@limb-pick-fetch` tmux option. Set to `on` to pass `--fetch` to
  `limb pick`, refreshing every repo's remote-tracking refs before the
  popup opens. Aligns with limb 0.2.0's new flag.
- README documents the in-picker `r` / `R` refresh keys and the
  `FETCHED` column shipped in limb 0.2.0.

## [0.1.0](https://github.com/ss0923/limb.tmux/releases/tag/v0.1.0) - 2026-04-22

Initial release.

### Added

- `prefix + W` key binding opens a popup worktree picker via
  `display-popup`. Powered by `limb pick` (requires the `limb` binary
  on `$PATH` and at least one entry in `projects.roots` of
  `~/.config/limb/config.toml`).
- Window reuse: if any existing tmux window's pane working directory
  resolves to the selected worktree's canonical path, that window is
  focused. Otherwise a new window opens at the selected path.
- Configurable picker key via the `@limb-pick-key` tmux option
  (default: `W`).
- Installable via [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).
