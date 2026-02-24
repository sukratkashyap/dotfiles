#!/bin/bash

set -e

if ! command -v brew >/dev/null 2>&1; then
    echo "- Installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "- Brew already installed, skipping install"
fi

brew analytics off

brew install \
    curl wget \
    gnu-sed grep watch gnu-tar jq \
    tmux vim \
    git gh \
    mise \
    python pipx poetry \
    podman podman-compose kubernetes-cli helm kind \
    ansible

brew install --cask \
    google-chrome \
    karabiner-elements alt-tab rectangle logi-options+ \
    tabby visual-studio-code github podman-desktop \
    mongodb-compass \
    mactex \
    unetbootin
