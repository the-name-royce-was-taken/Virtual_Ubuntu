FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    xfce4 xfce4-goodies \
    tigervnc-standalone-server \
    novnc websockify \
    git curl wget unzip \
    fonts-dejavu-core \
    x11-xserver-utils \
    dbus-x11 \
    xfce4-terminal \
    htop neofetch \
    gsettings-desktop-schemas \
    && apt clean

# Install AndixSH GTK + Icon theme
RUN mkdir -p /usr/share/themes /usr/share/icons && \
    cd /usr/share/themes && \
    git clone https://github.com/andixsh/AndixSH-Theme.git && \
    cd /usr/share/icons && \
    git clone https://github.com/andixsh/AndixSH-Icons.git

# Copy startup + config
COPY xstartup /etc/vnc/xstartup
COPY scripts/start-novnc.sh /usr/local/bin/start-novnc
RUN chmod +x /usr/local/bin/start-novnc /etc/vnc/xstartup

EXPOSE 6080

CMD ["start-novnc"]
