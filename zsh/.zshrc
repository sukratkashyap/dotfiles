export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="false"
plugins=()
source "$ZSH/oh-my-zsh.sh"

PROMPT="%{$fg_bold[blue]%}%M@%n %{$fg[cyan]%}%/ \$(git_prompt_info)
%(?:%{$fg_bold[green]%}$:%{$fg_bold[red]%}$)%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ✗%{$fg[blue]%})"

if [ -f "~/.zsh_profile" ]; then
    source ~/.zsh_profile
fi
