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

alias reload="omz reload"
alias work="cd ~/workplace"
alias dotfiles="cd ~/workplace/dotfiles"
alias docker=podman
alias ghub="github"
