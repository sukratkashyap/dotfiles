#!/bin/bash

echo "Installing"

echo "- Shell configuration"
ln -sfv "$(pwd)/shell/zshrc" ~/.zshrc
ln -sfv "$(pwd)/shell/zsh_theme" ~/.zsh_theme
mkdir -pv ~/.shell
ln -sfv $(pwd)/shell/shell/* ~/.shell

echo "- Git configuration"
git config --global include.path "$(pwd)/git/gitconfig"

echo "- SSH configuration"
mkdir -pv ~/.ssh
chmod 700 ~/.ssh
ln -sfv "$(pwd)/ssh/config" ~/.ssh/config

mkdir -pv ~/.ssh/config.d
chmod 700 ~/.ssh/config.d
ln -sfv $(pwd)/ssh/config.d/* ~/.ssh/config.d

echo "- Tmux configuration"
ln -sfv "$(pwd)/tmux/tmux.conf" ~/.tmux.conf

echo "- Installing other configs"
bash ./configs/install.sh
