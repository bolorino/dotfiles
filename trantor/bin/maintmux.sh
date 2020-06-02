#!/bin/bash
# First, check if the main session is already running
SESSION_NAME="main"

tmux has-session -t $SESSION_NAME 2>/dev/null

if [ "$?" -eq 1 ] ; then
    tmux new-session -s main -n zsh -d
    tmux new-window -n music -t main

    # Servers
    tmux new-window -n server -t main
 
    tmux split-window -h
    tmux split-window -v
    tmux select-pane -R


    tmux select-window -t main:1
    tmux attach -t main
else
    tmux attach-session -t $SESSION_NAME
fi
