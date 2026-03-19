# Helper Functions
OS_NAME=$(uname)
function is-macos() {
    if test "$OS_NAME" = "Darwin"; then
        return 0
    fi
    return 1
}

# Common
alias work="cd ~/workplace"
alias dotfiles="cd ~/workplace/dotfiles"

if test -n "${ZSH_VERSION:-}"; then
    alias reload="omz reload"
elif test -n "${BASH_VERSION:-}"; then
    alias reload="source ~/.bashrc"
fi

alias ghub="github"
alias ll="ls -lah"
if is-macos; then
    alias desk-upgrade="brew upgrade"
else
    alias desk-upgrade="sudo apt-get update && sudo apt-get upgrade -y"
fi

# Docker aliases
if command -v podman >/dev/null 2>&1; then
    if is-macos; then
        PODMAN_SOCKET_PATH="$(podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}' 2>/dev/null)"
        if test -n "${PODMAN_SOCKET_PATH}"; then
            export DOCKER_HOST="unix://${PODMAN_SOCKET_PATH}"
        fi
    else
        alias docker-compose='docker compose'
    fi
fi

# Mise
if command -v mise >/dev/null 2>&1; then
    if test -n "${ZSH_VERSION:-}"; then
        eval "$(mise activate zsh)"
    elif test -n "${BASH_VERSION:-}"; then
        eval "$(mise activate bash)"
    fi
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
if is-macos; then
    export PATH="$PATH:$(brew --prefix python)/libexec/bin"
fi
export PATH="$PATH:$HOME/.local/bin"
export POETRY_VIRTUALENVS_IN_PROJECT="true"
export POETRY_VIRTUALENVS_CREATE="true"

# Node
export PATH="$PATH:$HOME/.npm-global/bin"
