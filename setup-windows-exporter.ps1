cd ~\downloads

curl https://github.com/prometheus-community/windows_exporter/releases/download/v0.23.1/windows_exporter-0.23.1-amd64.msi -O windows_exporter.msi

msiexec /i windows_exporter.msi ENABLED_COLLECTORS="ad,cpu,cs,logon,memory,logical_disk,os,service,system,process,tcp,net,textfile,thermalzone"

New-NetFirewallRule -DisplayName "Allow Windows Exporter 9182" -Direction inbound -Profile Any -Action Allow -LocalPort 9182 -Protocol TCP
