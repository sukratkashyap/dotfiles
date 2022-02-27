#!/bin/bash

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

set -e

cp -v ./zsh/.zshrc ~/.zshrc
cp -v ./zsh/.zsh_profile ~/.zsh_profile
