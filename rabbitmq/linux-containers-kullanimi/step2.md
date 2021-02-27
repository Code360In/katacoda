# Kurulumu

## Erlang Kurulumu

RabbitMQ ön gereksinimi olan Erlan'a ait paketleri aşağıdaki komutla kurun;

```bash
sudo apt-get install -y erlang-base \
                        erlang-asn1 erlang-crypto erlang-eldap erlang-ftp erlang-inets \
                        erlang-mnesia erlang-os-mon erlang-parsetools erlang-public-key \
                        erlang-runtime-tools erlang-snmp erlang-ssl \
                        erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl
```{{execute}}

## RabbitMQ Kurulumu

Erlang/OTP kurulumu ardından aşağıdaki komut çalıştırarak RabbitMQ kurulumunu yapın;

`sudo apt-get install -y rabbitmq-server`{{execute}}

## RabbitMQ'yu Başlatma

Aşağıdaki komut ile RabbitMQ servisini başlatın;

`service rabbitmq-server start`{{execute}}

Servisin başlaması ardından aşağıdaki komutla kurulumu kontrol edin;

`rabbitmqctl status`{{execute}}