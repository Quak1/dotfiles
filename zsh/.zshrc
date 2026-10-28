eval "$(starship init zsh)"

TRANSIENT_PROMPT_TRANSIENT_PROMPT=$(starship module character)
source /opt/homebrew/share/zsh-transient-prompt/transient-prompt.zsh-theme

setopt glob_dots

alias gitl="git log --oneline"
alias gitlg="git log --oneline --graph --all"
alias venv-activate="source .venv/bin/activate"

# eval "$(fnm env --use-on-cd --shell zsh)"

export EDITOR="nvim"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

function checksha256() {
    local hash="${1#sha256:}" # remove prefix
    echo "$hash  $2" | sha256sum -c -
}
