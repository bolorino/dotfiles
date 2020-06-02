#!/bin/bash
TMUX_SESSION=main
PROJECT_ENV_DIRECTORY=${HOME}/virtualenvs/pelican/bolorino_net
PROJECT_CONTENT_DIRECTORY=blog
PROJECT_THEME_DIRECTORY=themes/FlexBolorino

tmux new-window -n pelican -t ${TMUX_SESSION}

tmux split-window -h
tmux split-window -v
tmux select-pane -t 1

# Activate Python environment on each panel
tmux setw synchronize-panes on

tmux send-keys -t ${TMUX_SESSION} "cd ${PROJECT_ENV_DIRECTORY}" C-m
tmux send-keys -t ${TMUX_SESSION} "source bin/activate" C-m
tmux send-keys -t ${TMUX_SESSION} "cd ${PROJECT_CONTENT_DIRECTORY}" C-m

tmux setw synchronize-panes off

# Pane 1 is selected
# Generate content
tmux send-keys -t ${TMUX_SESSION} "pelican content" C-m

tmux select-pane -t 2
tmux send-keys -t ${TMUX_SESSION} "pelican --listen" C-m

tmux select-pane -t 3
tmux send-keys -t ${TMUX_SESSION} "cd ${PROJECT_THEME_DIRECTORY}" C-m

# Back to the first pane
tmux select-pane -t 1
