export PATH=$PATH:/home/quak/.local/bin

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


calibre-sync() {
  if [ -n "$1" ]; then
    local location="$1"
  else
    local location="/home/quak/Documents/calibre"
  fi

  echo "Sync 84GDrive -> $location"
  rclone sync 84GDrive:Calibre $location -P

  calibre

  echo "\nSync $location -> 84GDrive"
  rclone sync $location 84GDrive:Calibre -P

  echo "\nSync done"
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

alias gitl="git log --oneline"
alias gitlg="git log --oneline --graph --all"
alias venv-activate="source .venv/bin/activate"
alias postgres-start="postgres -D ~/.local/share/postgres/var"
alias nvchad="NVIM_APPNAME=nvchad nvim"
alias spotify_player="TERM=xterm-256color spotify_player"
alias ncspot="flatpak run io.github.hrkfdn.ncspot"
alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'

# Turso
export PATH="$PATH:/home/quak/.turso"

eval $(thefuck --alias)
eval "$(zoxide init zsh)"
alias cd="z"
