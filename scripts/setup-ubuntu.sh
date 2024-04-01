#!/bin/bash

set -e

# Install common tools
sudo apt-get update
sudo apt-get install -y \
    wget curl \
    apt-transport-https ca-certificates \
    gnupg-agent software-properties-common \
    gcc g++ make build-essential

# Install dev tools
sudo apt-get install -y \
    git zsh tmux vim

# Chrome installation
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome.deb
sudo apt-get install -y /tmp/google-chrome.deb

# Python Installation
sudo apt-get install -y \
    python3 python3-dev python3-pip

# Java Installation
sudo apt-get install -y default-jdk

# Snap Installation
sudo apt-get install -y snapd
sudo snap install code --classic
sudo snap install go --classic
sudo snap install dotnet-sdk --classic
sudo snap install kubectl --classic
sudo snap install multipass

# Install Github CLI
sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# Github Desktop
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update && sudo apt install -y github-desktop

# Install Tabby
wget https://github.com/Eugeny/tabby/releases/download/v1.0.207/tabby-1.0.207-linux-x64.deb -O /tmp/tabby.deb
sudo apt-get install -y /tmp/tabby.deb

# ULauncher
sudo add-apt-repository universe -y && sudo add-apt-repository ppa:agornostal/ulauncher -y
sudo apt update && sudo apt install -y ulauncher
