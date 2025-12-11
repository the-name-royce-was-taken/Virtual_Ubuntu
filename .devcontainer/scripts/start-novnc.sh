#!/bin/bash

export DISPLAY=:1

mkdir -p /home/vscode/.vnc
echo "vscode" | vncpasswd -f > /home/vscode/.vnc/passwd
chmod 600 /home/vscode/.vnc/passwd

tigervncserver :1 -geometry 1280x720 -depth 24

websockify --web=/usr/share/novnc/ 6080 localhost:5901
