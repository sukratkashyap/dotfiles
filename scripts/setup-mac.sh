#!/bin/bash

set -e

function run_section() {
    SECTION_NAME="${1}"
    SECTION_TASK="${2}"
    read -p "Install ${SECTION_NAME}? [yn] " ANSWER
    if test "${ANSWER}" = "y" || test "${ANSWER}" = "Y"; then
        "${SECTION_TASK}"
    fi
}

function ensure_brew() {
    if ! command -v brew >/dev/null 2>&1; then
        echo "- Installing brew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "- Brew already installed, skipping install"
    fi

    brew analytics off
}

function install_formulae() {
    for FORMULA in "$@"; do
        if brew list "${FORMULA}" >/dev/null 2>&1; then
            echo "- ${FORMULA} already installed, skipping"
        else
            brew install "${FORMULA}"
        fi
    done
}

function install_casks() {
    for CASK in "$@"; do
        if brew list --cask "${CASK}" >/dev/null 2>&1; then
            echo "- ${CASK} already installed, skipping"
        else
            brew install --cask "${CASK}"
        fi
    done
}

function install_common_tools() {
    install_formulae \
        curl wget \
        git gh \
        tmux vim \
        gnu-sed grep watch gnu-tar jq
}

function install_common_dev_tools() {
    install_formulae \
        mise \
        python pipx poetry \
        ansible
}

function install_common_applications() {
    install_casks \
        google-chrome \
        karabiner-elements alt-tab rectangle logi-options+
}

function install_development_applications() {
    install_casks \
        github \
        tabby \
        visual-studio-code \
        mongodb-compass
}

function install_ai_tools() {
    install_formulae codex
    install_casks \
        codex-app \
        claude \
        claude-code
}

function install_containers() {
    install_formulae \
        podman podman-compose kubernetes-cli helm kind
    install_casks \
        podman-desktop
}

function install_specialized_apps() {
    install_casks \
        mactex \
        unetbootin
}

ensure_brew
run_section "common tools" install_common_tools
run_section "common dev tools" install_common_dev_tools
run_section "common applications" install_common_applications
run_section "development applications" install_development_applications
run_section "AI tools" install_ai_tools
run_section "container tools" install_containers
run_section "specialized apps" install_specialized_apps
