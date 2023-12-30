#!/bin/bash

set -e

echo "- Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

brew install \
    curl wget gnu-sed grep watch gnu-tar jq tmux \
    vim git

brew install --cask \
    logi-options-plus karabiner-elements alt-tab rectangle \
    gh github visual-studio-code
