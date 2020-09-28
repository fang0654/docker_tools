#!/bin/sh

session="main"

tmux start-server

tmux new-session -d -s $session

# tmux selectp -t 1
tmux send-keys "/opt/ngrok/ngrok http 8008" C-m

tmux splitw -v -p 50

tmux send-keys "/root/go/bin/webdav" C-m

tmux splitw -h -p 20
tmux send-keys "/usr/bin/start.sh" C-m

tmux attach-session -t $session
