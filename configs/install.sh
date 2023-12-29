#!/bin/bash

OS_NAME=$(uname)
function is-darwin() {
    if test "$OS_NAME" = "Darwin"; then
        return 0
    fi
    return 1
}

echo "Installing configs"

if is-darwin; then
    mkdir -pv ~/.config/karabiner
    ln -sfv "$(pwd)/configs/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json
fi
