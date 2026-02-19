# Helper Functions
OS_NAME=$(uname)
function is-macos() {
    if test "$OS_NAME" = "Darwin"; then
        return 0
    fi
    return 1
}

# Common

if is-macos; then
    export PATH="$PATH:$(brew --prefix python)/libexec/bin"
fi
export PATH="$PATH:$HOME/.local/bin"

alias reload="omz reload"
alias work="cd ~/workplace"
alias dotfiles="cd ~/workplace/dotfiles"
alias ghub="github"

if is-macos; then
    alias desk-upgrade="brew upgrade"
else
    alias desk-upgrade="sudo apt-get update && sudo apt-get upgrade -y"
fi

# Docker aliases
alias docker=podman

# Mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi


# Kubernetes Aliases
if command -v kubectl >/dev/null 2>&1; then
    alias k='kubectl'
    alias ksetns='kubectl config set-context --current --namespace'
    function kns() {
        echo "Setting namespace to: $1"
        alias k="kubectl -n $1"
    }
    alias kgp='kubectl get pods'
    alias kgs='kubectl get svc'
    alias kga='kubectl get all'
fi

# Python
export POETRY_VIRTUALENVS_IN_PROJECT="true"
export POETRY_VIRTUALENVS_CREATE="true"
