#!/bin/bash

set -e

echo "- Installing git configs"

git config --global alias.ch "checkout"
git config --global alias.br "branch"
git config --global alias.cm "commit"
git config --global alias.st "status"
git config --global alias.rh "reset --soft HEAD~1"
git config --global alias.lgs "log --pretty --oneline"

git config --global credential.helper "store"

git config --global push.default "current"

git config --global pull.ff "only"
git config --global pull.rebase "true"

function git-set-from-user() {
    key="$1"
    value="$(git config --global --get $key || true)"
    if [ -z "$value" ]
    then
        read -p "-- git $key = " value
    else
        echo "-- git $key = $value"
    fi
    git config --global "$key" "$value"
}

git-set-from-user "user.name"
git-set-from-user "user.email"
