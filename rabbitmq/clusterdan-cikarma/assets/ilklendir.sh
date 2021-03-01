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

RabbitMQ instance'ları hazırlanıyor...

1. Sunucu
=================
ilklendirmenin başlaması bekleniyor...
EOF

while [ ! -f /opt/.scriptStarted ] ; do sleep 2; done;

echo "Erlang kuruluyor..."
while [ ! -f /opt/.erlangfinished ] ; do sleep 2; done;

echo "RabbitMQ kuruluyor..."
while [ ! -f /opt/.rabbitfinished ] ; do sleep 2; done;

echo "Yönetim arayüzü kuruluyor..."
while [ ! -f /opt/.rabbitmanagementfinished ] ; do sleep 2; done;

echo "Yönetim arayüzü erişimi hazırlanıyor..."
while [ ! -f /opt/.nginxfinished ] ; do sleep 2; done;

echo "Kullanıcılar hazırlanıyor..."
while [ ! -f /opt/.alltasksfinished ] ; do sleep 2; done;

echo "RabbitMQ kullanıma hazır"
echo ""
echo "2. Sunucu"
echo "================="
echo "ilklendirmenin başlaması bekleniyor..."
ssh -o LogLevel=quiet node01 "while [ ! -f /opt/.scriptStarted ] ; do sleep 2; done;"

echo "Erlang kuruluyor..."
ssh -o LogLevel=quiet node01 "while [ ! -f /opt/.erlangfinished ] ; do sleep 2; done;"

echo "RabbitMQ kuruluyor..."
ssh -o LogLevel=quiet node01 "while [ ! -f /opt/.rabbitfinished ] ; do sleep 2; done;"

echo "Yönetim arayüzü kuruluyor..."
ssh -o LogLevel=quiet node01 "while [ ! -f /opt/.rabbitmanagementfinished ] ; do sleep 2; done;"

echo "Yönetim arayüzü erişimi hazırlanıyor..."
ssh -o LogLevel=quiet node01 "while [ ! -f /opt/.nginxfinished ] ; do sleep 2; done;"

echo "Kullanıcılar hazırlanıyor..."
ssh -o LogLevel=quiet node01 "while [ ! -f /opt/.alltasksfinished ] ; do sleep 2; done;"
echo "RabbitMQ kullanıma hazır"

echo ""
echo "Cluster oluşturuluyor"

ssh -o LogLevel=quiet node01 "systemctl stop rabbitmq-server" 2>/dev/null &> /dev/null
scp /var/lib/rabbitmq/.erlang.cookie rabbitmq02:/var/lib/rabbitmq/.erlang.cookie  2>/dev/null &> /dev/null
ssh -o LogLevel=quiet node01 "systemctl start rabbitmq-server" 2>/dev/null &> /dev/null
ssh -o LogLevel=quiet node01 "rabbitmqctl stop_app" 2>/dev/null &> /dev/null
ssh -o LogLevel=quiet node01 "rabbitmqctl join_cluster rabbit@rabbitmq01" 2>/dev/null &> /dev/null
ssh -o LogLevel=quiet node01 "rabbitmqctl start_app" 2>/dev/null &> /dev/null

echo ""
echo "RabbitMQ sunucuları kullanıma hazır..."