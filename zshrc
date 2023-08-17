# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/quak/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# prompt renderer
eval "$(oh-my-posh init zsh --config ~/.dotfiles/oh-my-posh-themes/theme.omp.json)"

export EDITOR=nvim

# Node NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
