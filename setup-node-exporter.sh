#!/bin/sh
clear
rm -rf /etc/systemd/system/node_exporter.service
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz

tar -xzvf node_exporter-1.6.1.linux-amd64.tar.gz
useradd -rs /bin/false nodeusr
mv node_exporter-1.6.1.linux-amd64/node_exporter /usr/local/bin/

tee -a /etc/systemd/system/node_exporter.service > /dev/null <<EOT
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=nodeusr
Group=nodeusr
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOT

systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter
systemctl status node_exporter
