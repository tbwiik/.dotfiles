# dotfiles

- Commit messages follow Conventional Commits: lowercase `type: summary` (`feat`, `fix`, `chore`, `docs`), imperative, no trailing period. One logical change per commit.
- Configs live in this repo and are symlinked into place by `symlink_path` in `setup.sh`. When adding a config, add its `symlink_path` line and update the "What gets linked" table in `README.md`.
- `setup.sh` must stay safe to re-run.
