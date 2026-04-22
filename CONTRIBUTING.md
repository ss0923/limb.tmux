# Contributing

## Proposing changes

Open an issue before starting non-trivial work to surface design
feedback and avoid duplicate effort.

## Development

Prerequisites: the [`limb`](https://github.com/ss0923/limb) binary on
`$PATH`, tmux 3.2 or later.

Clone the repository and source the plugin directly:

```sh
git clone https://github.com/ss0923/limb.tmux ~/.config/tmux/plugins/limb.tmux
echo "run-shell ~/.config/tmux/plugins/limb.tmux/limb.tmux" >> ~/.config/tmux/tmux.conf
tmux source-file ~/.config/tmux/tmux.conf
```

Verify shell-script syntax and lint before submitting:

```sh
bash -n limb.tmux scripts/pick.sh
shellcheck limb.tmux scripts/pick.sh
```

## Pull requests

The pull request title becomes the commit message on `main` when squash
merged. Format the title as a [Conventional
Commit](https://www.conventionalcommits.org/en/v1.0.0/):

```
feat: add support for <X>
fix: correct <Y> under <Z> condition
```

Individual commits on the feature branch are not required to follow any
format. A CI job validates only the pull request title.

## Licensing

Unless explicitly stated otherwise, contributions are dual-licensed under
MIT and Apache-2.0, matching the project license. See
[LICENSE-MIT](LICENSE-MIT) and [LICENSE-APACHE](LICENSE-APACHE).

## Code of conduct

This project follows the [Contributor Covenant Code of
Conduct](CODE_OF_CONDUCT.md).
