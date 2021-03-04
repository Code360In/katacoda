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

  #location ~* /api/(.*?)/(.*) {
  #      proxy_pass http://127.0.0.1:15672/api/$1/%2F/$2?$query_string;
  #      proxy_buffering                    off;
  #      proxy_set_header Host              $http_host;
  #      proxy_set_header X-Real-IP         $remote_addr;
  #      proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
  #      proxy_set_header X-Forwarded-Proto $scheme;
  #}

  location /api/consumers/ {
        rewrite ^/rabbitmq/api/(.*) /api/$1 break;
        proxy_pass http://127.0.0.1:15672/api/consumers/%2F/$1?$query_string;
        proxy_buffering                    off;
        proxy_set_header Host              $http_host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
  }

  location ~* /api/exchanges/(.*) {
        proxy_pass http://127.0.0.1:15672/api/exchanges/%2F/$1?$query_string;
        proxy_buffering                    off;
        proxy_set_header Host              $http_host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
  }

  location ~* /api/queues/(.*) {
        proxy_pass http://127.0.0.1:15672/api/queues/%2F/$1?$query_string;
        proxy_buffering                    off;
        proxy_set_header Host              $http_host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
  }

  location ~* /api/bindings/(.*) {
        proxy_pass http://127.0.0.1:15672/api/bindings/%2F/$1?$query_string;
        proxy_buffering                    off;
        proxy_set_header Host              $http_host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
  }

  location ~* /api/permissions/(.*) {
        proxy_pass http://127.0.0.1:15672/api/permissions/%2F/$1?$query_string;
        proxy_buffering                    off;
        proxy_set_header Host              $http_host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
  }

  location ~* /api/policies/(.*) {
        proxy_pass http://127.0.0.1:15672/api/policies/%2F/$1?$query_string;
        proxy_buffering                    off;
        proxy_set_header Host              $http_host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
  }

  location ~* /api/aliveness-test/(.*) {
        proxy_pass http://127.0.0.1:15672/api/aliveness-test/%2F/$1?$query_string;
        proxy_buffering                    off;
        proxy_set_header Host              $http_host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
  }

  location ~* /api/parameters/(.*)/(.*) {
        proxy_pass http://127.0.0.1:15672/api/parameters/$1/%2F/$2?$query_string;
        proxy_buffering                    off;
        proxy_set_header Host              $http_host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
  }

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

rabbitmqctl delete_user guest 2>/dev/null &> /dev/null

echo "rabbitmqadmin hazırlanıyor..."
wget http://localhost:15672/cli/rabbitmqadmin -O /usr/local/bin/rabbitmqadmin 2>/dev/null &> /dev/null
chmod +x /usr/local/bin/rabbitmqadmin 2>/dev/null &> /dev/null

echo ""
echo "RabbitMQ kullanıma hazır..."