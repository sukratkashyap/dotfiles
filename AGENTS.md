# AGENTS.md

This file provides guidance to AI coding agents (Claude Code, Cursor, Copilot, Codex, etc.) when working with code in this repository.

## Overview

This is a personal dotfiles repository using a symlink-based approach. Running `./install.sh` interactively walks through each component and creates symlinks from `~` to the tracked files here.

## Key Commands

```bash
./install.sh    # Interactive installer — prompts per component [y/n]
bash clean.sh   # Remove managed symlinks and unset git global include.path
```

For initial machine setup, run the appropriate script before `install.sh`:

```bash
bash scripts/setup-common.sh        # oh-my-zsh + plugins (all platforms)
bash scripts/setup-ubuntu.sh        # Full Ubuntu desktop bootstrap
bash scripts/setup-desk-ubuntu.sh   # Headless/server Ubuntu bootstrap
bash scripts/setup-mac.sh           # macOS via Homebrew (interactive sections)
```

## Architecture

**Symlink model**: `install.sh` does not copy files — it creates symlinks so edits in this repo take effect immediately in the live environment.

**Shell layering**: Both `zshrc` and `bashrc` source every file in `~/.shell/` (which itself is a symlink to `shell/shell/`). New shell config goes in `shell/shell/` as a numbered file (e.g. `02_work.sh`). `01_common.sh` is the main shared config (aliases, PATH, tool activation).

**Component mapping**:

| Directory | Target |
|---|---|
| `shell/zshrc` | `~/.zshrc` |
| `shell/bashrc` | `~/.bashrc` |
| `shell/zsh_theme` | `~/.zsh_theme` |
| `shell/shell/*` | `~/.shell/*` |
| `git/gitconfig` | referenced via `git config --global include.path` (common config) |
| `git/gitconfig-github` | included conditionally when remote URL matches `*github.com*` (user identity) |
| `ssh/config` | `~/.ssh/config` |
| `ssh/config.d/*` | `~/.ssh/config.d/*` |
| `tmux/tmux.conf` | `~/.tmux.conf` |
| `configs/vscode/settings.json` | `~/.config/Code/User/settings.json` (Linux) or `~/Library/Application Support/Code/User/settings.json` (macOS) |
| `configs/claude/settings.json` | `~/.claude/settings.json` |
| `configs/karabiner/` | `~/.config/karabiner/` (macOS only) |

**Platform variants**: VSCode and Tabby configs have `*-linux` and `*-macos` suffixed files; `install.sh` picks the right one based on `uname`.

## Commit Style

All commits follow conventional commits with a scope: `feat(scope): message` or `fix(scope): message`. Scope matches the component directory name (e.g. `shell`, `tmux`, `vscode`, `claude`).
