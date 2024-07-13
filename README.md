# prometheus
#Cài đặt node_exporter:  
~~~
bash <(wget -qO- https://raw.githubusercontent.com/zhostvn/prometheus/main/setup-node-exporter.sh)
~~~
#Cài đặt windows_exporter: 
~~~
$ScriptFromGitHub = Invoke-WebRequest https://raw.githubusercontent.com/zhostvn/prometheus/main/setup-windows-exporter.ps1
Invoke-Expression $($ScriptFromGitHub.Content)
~~~
#Cài đặt pve_exporter: 
~~~
bash <(wget -qO- https://raw.githubusercontent.com/zhostvn/prometheus/main/setup-pve-exporter.sh)
~~~
