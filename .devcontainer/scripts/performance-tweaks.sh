#!/bin/bash
set -e
echo "vm.swappiness=10" >> /etc/sysctl.conf
echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf
sysctl -p
