#!/bin/bash

set -e

OS_NAME=$(uname)
function is-darwin() {
    if test "$OS_NAME" = "Darwin"; then
        return 0
    fi
    return 1
}

function configure_shell() {
    echo "- Shell configuration"
    ln -sfv "$(pwd)/shell/zshrc" ~/.zshrc
    ln -sfv "$(pwd)/shell/zsh_theme" ~/.zsh_theme
    ln -sfv "$(pwd)/shell/bashrc" ~/.bashrc
    mkdir -pv ~/.shell
    ln -sfv "$(pwd)/shell/shell/"* ~/.shell
}

function configure_git() {
    echo "- Git configuration"
    git config --global include.path "$(pwd)/git/gitconfig"
}

function configure_ssh() {
    echo "- SSH configuration"
    mkdir -pv ~/.ssh/config.d
    chmod 700 ~/.ssh
    ln -sfv "$(pwd)/ssh/config" ~/.ssh/config
    chmod 700 ~/.ssh/config.d
    ln -sfv "$(pwd)/ssh/config.d/"* ~/.ssh/config.d
}

function configure_tmux() {
    echo "- Tmux configuration"
    ln -sfv "$(pwd)/tmux/tmux.conf" ~/.tmux.conf
}

function configure_karabiner() {
    if is-darwin; then
        echo "- Karabiner configuration"
        ln -sfv "$(pwd)/configs/karabiner" ~/.config
    fi
}

echo "Installing"
configure_shell
configure_git
configure_ssh
configure_tmux
configure_karabiner
