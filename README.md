# prometheus
#Cài đặt node_exporter:  
~~~
wget https://raw.githubusercontent.com/zhostvn/prometheus/main/setup-node-exporter.sh && chmod +x setup-node-exporter.sh && bash setup-node-exporter.sh
~~~
#Cài đặt windows_exporter: 
~~~
$ScriptFromGitHub = Invoke-WebRequest https://raw.githubusercontent.com/zhostvn/prometheus/main/setup-windows-exporter.ps1
Invoke-Expression $($ScriptFromGitHub.Content)
~~~
