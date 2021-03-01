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

echo "Örnek ortam hazırlanıyor..."

rabbitmq-plugins enable rabbitmq_management 2>/dev/null &> /dev/null

rabbitmqctl add_vhost uygulama1 2>/dev/null &> /dev/null

rabbitmqctl add_user enterprisecoding enterprisecoding 2>/dev/null &> /dev/null
rabbitmqctl set_user_tags enterprisecoding administrator 2>/dev/null &> /dev/null

rabbitmqctl set_permissions -p / enterprisecoding ".*" ".*" ".*" 2>/dev/null &> /dev/null
rabbitmqctl set_permissions -p default enterprisecoding ".*" ".*" ".*" 2>/dev/null &> /dev/null

wget http://localhost:15672/cli/rabbitmqadmin -O /usr/local/bin/rabbitmqadmin 2>/dev/null &> /dev/null
chmod +x /usr/local/bin/rabbitmqadmin 2>/dev/null &> /dev/null

rabbitmqadmin declare exchange name=ornekExchange1 durable=false type=direct 2>/dev/null &> /dev/null
rabbitmqadmin declare exchange name=ornekExchange2 durable=false type=topic 2>/dev/null &> /dev/null
rabbitmqadmin declare exchange name=ornekExchange3 durable=false type=fanout 2>/dev/null &> /dev/null

rabbitmqadmin declare queue name=ornekQueue1 durable=false 2>/dev/null &> /dev/null
rabbitmqadmin declare queue name=ornekQueue2 durable=false 2>/dev/null &> /dev/null
rabbitmqadmin declare queue name=ornekQueue3 durable=false 2>/dev/null &> /dev/null

rabbitmqadmin declare binding source=ornekExchange1 destination=ornekQueue1 routing_key="personel.is-emri.ayrilma" 2>/dev/null &> /dev/null
rabbitmqadmin declare binding source=ornekExchange2 destination=ornekQueue2 routing_key="personel.is-emri.ayrilma" 2>/dev/null &> /dev/null
rabbitmqadmin declare binding source=ornekExchange3 destination=ornekQueue3 2>/dev/null &> /dev/null

rm -f /usr/local/bin/rabbitmqadmin 2>/dev/null &> /dev/null
rabbitmq-plugins disable rabbitmq_management 2>/dev/null &> /dev/null

echo ""
echo "RabbitMQ kullanıma hazır..."