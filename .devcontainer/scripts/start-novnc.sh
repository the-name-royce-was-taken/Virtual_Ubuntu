#!/bin/bash
export DISPLAY=:1
Xvfb :1 -screen 0 1280x720x24 &
sleep 2
x11vnc -display :1 -rfbauth ~/.vnc/passwd -forever -shared -rfbport 5901 &
sleep 2
websockify --web=/usr/share/novnc 6080 localhost:5901
