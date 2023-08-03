if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Enable transient prompt
function starship_transient_rprompt_func
  starship module time
end
# Setup starship with fish
starship init fish | source
enable_transience

set -x EDITOR nvim
