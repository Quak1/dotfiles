eval "$(starship init zsh)"

TRANSIENT_PROMPT_TRANSIENT_PROMPT=$(starship module character)
source /opt/homebrew/share/zsh-transient-prompt/transient-prompt.zsh-theme

setopt glob_dots

alias gitl="git log --oneline"
alias gitlg="git log --oneline --graph --all"
alias venv-activate="source .venv/bin/activate"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:$HOME/go/bin
