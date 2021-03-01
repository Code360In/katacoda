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

RabbitMQ instance'ları kuruluyor...

1. Sunucu
=================
Erlang kuruluyor...
EOF

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

echo "2. Sunucu"
echo "================="
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
echo "RabbitMQ sunucuları kullanıma hazır..."