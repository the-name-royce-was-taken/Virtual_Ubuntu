#!/bin/bash

mkdir -p /home/vscode/.config/xfce4/xfconf/xfce-perchannel-xml

cat <<EOF > /home/vscode/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
<?xml version="1.0" encoding="UTF-8"?>
<channel name="xsettings" version="1.0">
    <property name="Net" type="empty">
        <property name="ThemeName" type="string" value="AndixSH-Theme" />
        <property name="IconThemeName" type="string" value="AndixSH-Icons" />
    </property>
</channel>
EOF

cat <<EOF > /home/vscode/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
<?xml version="1.0" encoding="UTF-8"?>
<channel name="xfce4-panel" version="1.0">
    <property name="panels" type="array">
        <value type="int" value="1"/>
    </property>
    <property name="panel-1" type="empty">
        <property name="position" type="string" value="p=6;x=0;y=0"/>
        <property name="size" type="int" value="32"/>
    </property>
</channel>
EOF

chown -R vscode:vscode /home/vscode
