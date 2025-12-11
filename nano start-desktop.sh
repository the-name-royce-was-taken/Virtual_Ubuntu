#!/usr/bin/env bash

echo "[1/6] Installing packages..."
sudo apt update
sudo apt install -y xfce4 xvfb x11vnc novnc websockify

echo "[2/6] Starting Xvfb..."
Xvfb :1 -screen 0 1280x720x24 &
sleep 2

echo "[3/6] Exporting DISPLAY..."
export DISPLAY=:1

echo "[4/6] Starting Xfce..."
startxfce4 &
sleep 3

echo "[5/6] Starting x11vnc..."
# No password to avoid NoVNC typing bugs
x11vnc -display :1 -forever -shared -nopw &
sleep 2

echo "[6/6] Starting noVNC web server (port 6080)..."
websockify --web=/usr/share/novnc/ 6080 localhost:5900 &

echo "--------------------------------------------------------"
echo " 🎉 Desktop is ready!"
echo " Open this in your browser:"
echo "     http://127.0.0.1:6080/vnc.html"
echo "--------------------------------------------------------"
