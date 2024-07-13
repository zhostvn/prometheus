apt install python3-pip -y
rm -rf /usr/lib/python3.11/EXTERNALLY-MANAGED
python3 -m pip install prometheus-pve-exporter
rm -rf /etc/prometheus
rm -rf /etc/systemd/system/pve_exporter.service

mkdir /etc/prometheus
touch /etc/prometheus/pve.yml


tee -a /etc/prometheus/pve.yml > /dev/null <<EOT
default:
    user: root@pam
    token_name: "root_prometheus"
    token_value: "ce5b985c-cd27-4d1d-90a9-f77c5ec7e31b"
    verify_ssl: false
EOT


tee -a /etc/systemd/system/pve_exporter.service > /dev/null <<EOT
[Unit]
Description=PVE Exporter
After=network.target

[Service]
User=nodeusr
Group=nodeusr
Type=simple
ExecStart=pve_exporter --collector.status

[Install]
WantedBy=multi-user.target
EOT


systemctl daemon-reload
systemctl start pve_exporter
systemctl enable pve_exporter
systemctl status pve_exporter
