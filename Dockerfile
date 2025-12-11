FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1
WORKDIR /workspace

RUN apt-get update && apt-get install -y --no-install-recommends \
    xfce4 xfce4-goodies \
    x11vnc xvfb \
    novnc websockify \
    supervisor \
    x11-utils xterm wget curl git \
    picom plank \
    arc-theme gtk2-engines-murrine gtk2-engines-pixbuf \
    fonts-noto-color-emoji fonts-noto \
    libgl1-mesa-dri libgl1-mesa-glx \
    python3-pip unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/archive/refs/heads/master.zip -o /tmp/papirus.zip \
  && unzip /tmp/papirus.zip -d /tmp \
  && mkdir -p /usr/share/icons/Papirus \
  && cp -r /tmp/papirus-icon-theme-master/Papirus /usr/share/icons/ || true \
  && rm -rf /tmp/papirus*

RUN mkdir -p /workspace /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start-desktop.sh /workspace/start-desktop.sh
RUN chmod +x /workspace/start-desktop.sh

EXPOSE 6080 5901
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
