#!/bin/bash
clear
cat << "EOF"
==================================================================================
   ______       _                       _                        _ _
  |  ____|     | |                     (_)                      | (_)
  | |__   _ __ | |_ ___ _ __ _ __  _ __ _ ___  ___  ___ ___   __| |_ _ __   __ _
  |  __| | '_ \| __/ _ \ '__| '_ \| '__| / __|/ _ \/ __/ _ \ / _` | | '_ \ / _` |
  | |____| | | | ||  __/ |  | |_) | |  | \__ \  __/ (_| (_) | (_| | | | | | (_| |
  |______|_| |_|\__\___|_|  | .__/|_|  |_|___/\___|\___\___/ \__,_|_|_| |_|\__, |
                            | |                                             __/ |
                            |_|                                            |___/
===================================================================================

RabbitMQ kuruluyor...
EOF

(curl -fsSL https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc | sudo apt-key add - ) 2>/dev/null &> /dev/null
sudo apt-get install apt-transport-https 2>/dev/null &> /dev/null
echo "deb https://dl.bintray.com/rabbitmq-erlang/debian xenial erlang" | sudo tee /etc/apt/sources.list.d/bintray.erlang.list 2>/dev/null &> /dev/null
echo "deb https://dl.bintray.com/rabbitmq/debian xenial main" | sudo tee /etc/apt/sources.list.d/bintray.rabbitmq.list 2>/dev/null &> /dev/null

sudo apt-get update -y 2>/dev/null &> /dev/null

sudo apt-get install -y erlang-base \
                        erlang-asn1 erlang-crypto erlang-eldap erlang-ftp erlang-inets \
                        erlang-mnesia erlang-os-mon erlang-parsetools erlang-public-key \
                        erlang-runtime-tools erlang-snmp erlang-ssl \
                        erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl 2>/dev/null &> /dev/null

sudo apt-get install -y rabbitmq-server 2>/dev/null &> /dev/null

echo "RabbitMQ hizmeti başlatılıyor..."

service rabbitmq-server start 2>/dev/null &> /dev/null

echo "Yönetim arayüzü eklentisi kuruluyor..."
rabbitmq-plugins enable rabbitmq_management 2>/dev/null &> /dev/null

echo "Yönetim arayüzü erişimi hazırlanıyor..."
sudo apt-get install nginx -y 2>/dev/null &> /dev/null

cat > /etc/nginx/sites-available/default <<EOF
server {
  listen 80 default_server;
  listen [::]:80 default_server;

  server_name _;

  location / {
      proxy_pass http://127.0.0.1:15672;
      proxy_buffering                    off;
      proxy_set_header Host              \$http_host;
      proxy_set_header X-Real-IP         \$remote_addr;
      proxy_set_header X-Forwarded-For   \$proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto \$scheme;
  }
}
EOF

sudo systemctl reload nginx 2>/dev/null &> /dev/null

echo "Yetkili kullanıcı oluşturuluyor..."

rabbitmqctl add_user enterprisecoding enterprisecoding 2>/dev/null &> /dev/null
rabbitmqctl set_user_tags enterprisecoding administrator 2>/dev/null &> /dev/null

rabbitmqctl set_permissions -p / enterprisecoding ".*" ".*" ".*" 2>/dev/null &> /dev/null

#rabbitmqctl delete_user guest 2>/dev/null &> /dev/null


echo "Prometheus kuruluyor..."
useradd -M-s /bin/false prometheus 2>/dev/null &> /dev/null
useradd -M -s /bin/false prometheus 2>/dev/null &> /dev/null
useradd --no-create-home -s /bin/false node_exporter 2>/dev/null &> /dev/null
sudo mkdir /etc/prometheus 2>/dev/null &> /dev/null
sudo mkdir /var/lib/prometheus 2>/dev/null &> /dev/null
sudo chown prometheus:prometheus /etc/prometheus 2>/dev/null &> /dev/null
sudo chown prometheus:prometheus /var/lib/prometheus 2>/dev/null &> /dev/null
curl -LO https://github.com/prometheus/prometheus/releases/download/v2.25.0/prometheus-2.25.0.linux-amd64.tar.gz 2>/dev/null &> /dev/null
tar xvf prometheus-2.25.0.linux-amd64.tar.gz  2>/dev/null &> /dev/null
sudo cp prometheus-2.25.0.linux-amd64/prometheus /usr/local/bin/ 2>/dev/null &> /dev/null
sudo cp prometheus-2.25.0.linux-amd64/promtool /usr/local/bin/ 2>/dev/null &> /dev/null
sudo chown prometheus:prometheus /usr/local/bin/prometheus 2>/dev/null &> /dev/null
sudo chown prometheus:prometheus /usr/local/bin/promtool 2>/dev/null &> /dev/null
sudo cp -r prometheus-2.25.0.linux-amd64/consoles /etc/prometheus 2>/dev/null &> /dev/null
sudo cp -r prometheus-2.25.0.linux-amd64/console_libraries /etc/prometheus 2>/dev/null &> /dev/null
sudo chown -R prometheus:prometheus /etc/prometheus/consoles 2>/dev/null &> /dev/null
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries 2>/dev/null &> /dev/null
rm -rf prometheus-2.25.0.linux-amd64 prometheus-2.25.0.linux-amd64.tar.gz  2>/dev/null &> /dev/null

cat > /etc/prometheus/prometheus.yml <<EOF
global:
  scrape_interval: 15s 
  scrape_timeout: 15s
scrape_configs:
  - job_name: 'rabbitmq'
    scheme: http
    static_configs:
    - targets: ['127.0.0.1:15672']
EOF


cat > /etc/systemd/system/prometheus.service <<EOF
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \\
     --config.file /etc/prometheus/prometheus.yml \\
     --storage.tsdb.path /var/lib/prometheus \\
     --web.console.templates=/etc/prometheus/console \\
     --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload 2>/dev/null &> /dev/null
#sudo systemctl start prometheus 2>/dev/null &> /dev/null
sudo systemctl enable prometheus 2>/dev/null &> /dev/null

echo "Grafana kuruluyor..." 
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add - 2>/dev/null &> /dev/null

echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list 2>/dev/null &> /dev/null
sudo apt-get update 2>/dev/null &> /dev/null
sudo apt-get install grafana -y 2>/dev/null &> /dev/null

#mkdir -p /etc/dashboards/rabbitmq 2>/dev/null &> /dev/null

cat > /etc/grafana/provisioning/dashboards/rabbitmq.yaml <<EOF
apiVersion: 1

datasources:
  - name: Prometheus
    url: http://localhost:9090
    type: testdata
EOF

cat > /etc/grafana/provisioning/dashboards/rabbitmq.yaml <<EOF
apiVersion: 1

providers:
- name: dashboards
  type: file
  updateIntervalSeconds: 30
  options:
    path: /etc/dashboards
    foldersFromFilesStructure: true
EOF

sudo systemctl daemon-reload 2>/dev/null &> /dev/null
sudo systemctl enable grafana-server 2>/dev/null &> /dev/null
sudo systemctl start grafana-server 2>/dev/null &> /dev/null

sleep 10 2>/dev/null &> /dev/null
grafana-cli admin reset-admin-password enterprisecoding 2>/dev/null &> /dev/null

echo ""
echo "RabbitMQ kullanıma hazır..."