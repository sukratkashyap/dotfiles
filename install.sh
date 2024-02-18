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

function configure_jetbrains() {
    PRODUCT_NAME="$1"
    DIR_NAME="$2"
    echo "- Jetbrains configuration ($PRODUCT_NAME)"
    if is-darwin; then
        for dir in ~/"Library/Application Support/JetBrains/${PRODUCT_NAME}"*; do
            echo "-- Directory: $dir"
            mkdir -pv "${dir}/keymaps"
            ln -sfv "$(pwd)/configs/${DIR_NAME}/"* "${dir}/keymaps"
        done
    fi
}

function configure_vscode() {
    echo "- VSCode configuration"
    if is-darwin; then
        ln -sfv "$(pwd)/configs/vscode/keybindings-mac.json" ~/"Library/Application Support/Code/User/keybindings.json"
    fi
}

echo "Installing"
configure_shell
configure_git
configure_ssh
configure_tmux
configure_karabiner
configure_jetbrains "DataGrip" "datagrip"
configure_jetbrains "JetBrainsClient" "intellij"
configure_vscode
