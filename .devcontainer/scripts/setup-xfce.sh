#!/bin/bash
set -e
apt update
apt install -y xfce4 xfce4-goodies x11vnc xvfb websockify novnc
mkdir -p ~/.vnc
x11vnc -storepasswd 12345 ~/.vnc/passwd
chmod 600 ~/.vnc/passwd
mkdir -p ~/.vnc
cp /.devcontainer/xstartup ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup
bash .devcontainer/scripts/performance-tweaks.sh
