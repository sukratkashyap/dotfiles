#!/bin/bash

set -e

OS_NAME=$(uname)
function is-macos() {
    if test "$OS_NAME" = "Darwin"; then
        return 0
    fi
    return 1
}

function run-configure() {
    CONFIG_NAME="${1}"
    CONFIG_TASK="${2}"
    read -p "Configure $CONFIG_NAME? [yn] " ANSWER
    if test "$ANSWER" = "y"; then
        $CONFIG_TASK
    fi
}

function configure-shell() {
    echo "- Configuring shell"
    ln -sfnv "$(pwd)/shell/zshrc" ~/.zshrc
    ln -sfnv "$(pwd)/shell/zsh_theme" ~/.zsh_theme
    ln -sfnv "$(pwd)/shell/bashrc" ~/.bashrc
    mkdir -pv ~/.shell
    ln -sfnv "$(pwd)/shell/shell/"* ~/.shell
}

function configure-git() {
    echo "- Configuring git"
    git config --global include.path "$(pwd)/git/gitconfig"
    echo "-- include.path value"
    git config get include.path
}

function configure-ssh() {
    echo "- Configuring SSH"
    mkdir -pv ~/.ssh/config.d
    ln -sfnv "$(pwd)/ssh/config" ~/.ssh/config
    ln -sfnv "$(pwd)/ssh/config.d/"* ~/.ssh/config.d
    echo "-- Setting permissions"
    chmod -v -R 700 ~/.ssh
}

function configure-tmux() {
    echo "- Configuring tmux"
    ln -sfnv "$(pwd)/tmux/tmux.conf" ~/.tmux.conf
}

function configure-vscode() {
    echo "- Configuring vscode"
    if is-macos; then
        ln -sfnv "$(pwd)/configs/vscode/keybindings-macos.json" ~/"Library/Application Support/Code/User/keybindings.json"
        ln -sfnv "$(pwd)/configs/vscode/settings.json" ~/"Library/Application Support/Code/User/settings.json"
    elif test -d ~/.config/Code/User/; then
        ln -sfnv "$(pwd)/configs/vscode/keybindings.json" ~/.config/Code/User/keybindings.json
        ln -sfnv "$(pwd)/configs/vscode/settings.json" ~/.config/Code/User/settings.json
    fi
}

function configure-tabby() {
    echo "- Configure tabby"
    if is-macos; then
        ln -sfnv "$(pwd)/configs/tabby/config-macos.yaml" ~/"Library/Application Support/tabby/config.yaml"
    elif test -d ~/.config/tabby/; then
        ln -sfnv "$(pwd)/configs/tabby/config-linux.yaml" ~/.config/tabby/config.yaml
    fi
}

function configure-karabiner() {
    echo "- Configure karabiner"
    if is-macos; then
        mkdir -pv ~/.config
        ln -sfnv "$(pwd)/configs/karabiner" ~/.config/karabiner
    fi
}

echo "DOTFILES CONFIGURATION"
run-configure shell configure-shell
run-configure git configure-git
run-configure ssh configure-ssh
run-configure tmux configure-tmux
run-configure vscode configure-vscode
run-configure tabby configure-tabby
run-configure karabiner configure-karabiner
