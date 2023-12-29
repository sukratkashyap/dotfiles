#!/bin/bash

set -e

# Install ohmyzsh
export ZSH=${ZSH:-~/.oh-my-zsh}
export ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
test -d ${ZSH} || git clone https://github.com/ohmyzsh/ohmyzsh.git ${ZSH}
test -d ${ZSH_CUSTOM}/plugins/zsh-autosuggestions || git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
test -d ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
