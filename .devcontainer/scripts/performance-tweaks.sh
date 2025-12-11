#!/bin/bash

# Improve memory usage
echo "vm.swappiness=10" >> /etc/sysctl.conf
echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf

# Enable ZSWAP even without systemd
modprobe zswap || true
echo 1 > /sys/module/zswap/parameters/enabled || true

# CPU performance tweak (best effort on Codespaces)
echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null || true
