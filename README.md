# dotfiles

macOS setup: zsh (Oh My Zsh + Powerlevel10k), Neovim (NvChad), git, gh, VS Code, iTerm2 and Homebrew packages.

## Install

```sh
git clone https://github.com/tbwiik/.dotfiles.git ~/.dotfiles
~/.dotfiles/setup.sh
```

`setup.sh` is safe to re-run. It installs Homebrew, the `Brewfile` packages, Oh My Zsh with plugins and theme, symlinks the configs below, syncs Neovim plugins and applies `.macos.sh` defaults.

Existing files at a symlink target are moved to `<file>.backup`; existing symlinks are replaced.

## What gets linked

| Repo | Target |
|------|--------|
| `.zshrc`, `.zshenv`, `.p10k.zsh`, `.aliases`, `.gitconfig` | `~/` |
| `git/ignore` | `~/.config/git/ignore` |
| `nvim/` | `~/.config/nvim` |
| `gh/config.yml` | `~/.config/gh/config.yml` |
| `vscode/settings.json` | `~/Library/Application Support/Code/User/settings.json` |
| `copilot/copilot-instructions.md` | `~/.copilot/copilot-instructions.md` |
| `iterm2/dotfiles-profile.json` | `~/Library/Application Support/iTerm2/DynamicProfiles/` |

## Manual steps

- If VS Code Settings Sync is on, exclude Settings so it doesn't fight the symlink.
- Create ssh keys and add to github.
- Change origin of this repo from https to ssh.

## Known confusions 
- Homebrew asks you to add it to path - this is part of setup script
