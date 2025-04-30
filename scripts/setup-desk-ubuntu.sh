#!/bin/bash

set -e

echo "- Installing common packages"
sudo apt-get update
sudo apt-get install -y \
    wget curl \
    apt-transport-https ca-certificates \
    gnupg-agent software-properties-common \
    gcc g++ make build-essential \
    zsh tmux vim

echo "- Set ZSH as default shell"
sudo chsh -s $(which zsh) $USER

echo "- Installing DEV packages"
sudo apt-get install -y \
    git \
    python3 python3-dev python3-pip \
    default-jdk
