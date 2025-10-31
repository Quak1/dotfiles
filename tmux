# allow focus event to ge through to application running in tmux
set-option -g focus-events on

# Proper colors
set-option -g default-terminal "tmux-256color"
set-option -sa terminal-features ',*:RGB'

# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# reload config file
bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded"

# start with window and pane with 1 and renumber when window is deleted
set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows on

# shorten command delay
set -g escape-time 0

# don't rename windows automatically
set-option -g allow-rename off

# enable mouse control 
set -g mouse on

# enable vi mode keys
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

# increase scroll history
# set -g history-limit 5000

# Allow default copy and pasting behaviour
set -s set-clipboard external

# split panes using | and -
unbind '"'
unbind %
bind-key "|" split-window -h -c "#{pane_current_path}"
bind-key "\\" split-window -fh -c "#{pane_current_path}"
bind-key "-" split-window -v -c "#{pane_current_path}"
bind-key "_" split-window -fv -c "#{pane_current_path}"

# open new windows in current path
bind c new-window -c "#{pane_current_path}"

# swap windows position
bind -r "<" swap-window -d -t -1
bind -r ">" swap-window -d -t +1

# switch panes using hjkl
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind -r C-j resize-pane -D 5
bind -r C-k resize-pane -U 5
bind -r C-h resize-pane -L 5
bind -r C-l resize-pane -R 5

# toggle between current and previous window
bind a last-window

# join pane from another window
bind y choose-window 'join-pane -s "%%"'
bind Y choose-window 'join-pane -h -s "%%"'

# save and kill session
bind C-q run-shell '~/.config/tmux/plugins/tmux-resurrect/scripts/save.sh' \; kill-session

# statusbar
set -g status-style 'fg=blue'
set -g status-left '#{?client_prefix,#[fg=green],#[fg=red]} '

set -g status-right-style 'fg=black bg=yellow'
set -g status-right '#[fg=yellow bg=terminal]#[fg=black bg=yellow][#S] %Y-%m-%d %H:%M#[fg=yellow bg=terminal]'

setw -g window-status-current-style 'fg=black bg=blue bold'
setw -g window-status-current-format '#[fg=blue bg=terminal]#[fg=black bg=blue]#I #W#F#[fg=blue bg=terminal]'

setw -g window-status-style 'fg=blue'
setw -g window-status-separator ''
setw -g window-status-format ' #I #[fg=white]#W#[fg=yellow]#F '

setw -g window-status-bell-style 'fg=yellow bg=red bold'

# messages
set -g message-style 'fg=red bg=terminal bold'

# plugins
set -g @plugin 'tmux-plugins/tmux-resurrect' # save/restore sessions
set -g @resurrect-processes 'spotify_player'

run '~/.tmux/plugins/tpm/tpm'
