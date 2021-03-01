systemctl stop kubelet
systemctl disable kubelet

if [ $HOSTNAME == "controlplane" ]
then
    hostnamectl set-hostname rabbitmq01
    RABBITMQ01_IP=$(hostname -I | cut -d' ' -f1) 
    RABBITMQ02_IP=$(ssh -o LogLevel=quiet node01 hostname -I | cut -d' ' -f1)

    echo "$RABBITMQ01_IP  rabbitmq01" >> /etc/hosts
    echo "$RABBITMQ02_IP  rabbitmq02" >> /etc/hosts
    
    scp node01:/etc/hosts /tmp/node01_hosts
    echo "$RABBITMQ01_IP  rabbitmq01" >> /tmp/node01_hosts
    echo "$RABBITMQ02_IP  rabbitmq02" >> /tmp/node01_hosts
    scp /tmp/node01_hosts node01:/etc/hosts
else
    hostnamectl set-hostname rabbitmq02
fi


curl -fsSL https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://dl.bintray.com/rabbitmq-erlang/debian xenial erlang" | sudo tee /etc/apt/sources.list.d/bintray.erlang.list
echo "deb https://dl.bintray.com/rabbitmq/debian xenial main" | sudo tee /etc/apt/sources.list.d/bintray.rabbitmq.list

sudo apt-get update -y

sudo apt-get install -y erlang-base \
                        erlang-asn1 erlang-crypto erlang-eldap erlang-ftp erlang-inets \
                        erlang-mnesia erlang-os-mon erlang-parsetools erlang-public-key \
                        erlang-runtime-tools erlang-snmp erlang-ssl \
                        erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl

touch /opt/.erlangfinished

sudo apt-get install -y rabbitmq-server

service rabbitmq-server start

touch /opt/.rabbitfinished

rabbitmq-plugins enable rabbitmq_management

touch /opt/.rabbitmanagementfinished

sudo apt-get install nginx -y

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

sudo systemctl reload nginx

touch /opt/.nginxfinished

rabbitmqctl delete_vhost /
rabbitmqctl add_vhost default

rabbitmqctl add_user enterprisecoding enterprisecoding
rabbitmqctl set_user_tags enterprisecoding administrator

rabbitmqctl set_permissions -p / enterprisecoding ".*" ".*" ".*"
rabbitmqctl set_permissions -p default enterprisecoding ".*" ".*" ".*"

rabbitmqctl delete_user guest

touch /opt/.alltasksfinished