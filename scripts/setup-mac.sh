#!/bin/bash

set -e

echo "- Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

brew install \
    curl wget \
    gnu-sed grep watch gnu-tar jq \
    tmux vim \
    git gh \
    python pipx poetry \
    podman kubernetes-cli helm \
    ansible

brew install --cask \
    google-chrome \
    karabiner-elements alt-tab rectangle logi-options+ \
    tabby visual-studio-code github \
    mongodb-compass \
    mactex \
    unetbootin
