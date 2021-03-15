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
rabbitmqctl delete_vhost / 2>/dev/null &> /dev/null
rabbitmqctl add_vhost default 2>/dev/null &> /dev/null

rabbitmqctl add_user enterprisecoding enterprisecoding 2>/dev/null &> /dev/null
rabbitmqctl set_user_tags enterprisecoding administrator 2>/dev/null &> /dev/null

rabbitmqctl set_permissions -p / enterprisecoding ".*" ".*" ".*" 2>/dev/null &> /dev/null
rabbitmqctl set_permissions -p default enterprisecoding ".*" ".*" ".*" 2>/dev/null &> /dev/null

rabbitmqctl delete_user guest 2>/dev/null &> /dev/null

echo ""
echo "RabbitMQ kullanıma hazır..."

echo "LDAP kuruluyor"

cat > /root/debconf-slapd.conf << 'EOF'
slapd slapd/password1 password enterprisecoding
slapd slapd/internal/adminpw password enterprisecoding
slapd slapd/internal/generated_adminpw password enterprisecoding
slapd slapd/password2 password enterprisecoding
slapd slapd/unsafe_selfwrite_acl note
slapd slapd/purge_database boolean false
slapd slapd/domain string enterprisecoding.local
slapd slapd/ppolicy_schema_needs_update select abort installation
slapd slapd/invalid_config boolean true
slapd slapd/move_old_database boolean false
slapd slapd/backend select HDB
slapd shared/organization string enterprisecoding
slapd slapd/dump_database_destdir string /var/backups/slapd-VERSION
slapd slapd/no_configuration boolean false
slapd slapd/dump_database select when needed
slapd slapd/password_mismatch note
EOF

cat /root/debconf-slapd.conf | debconf-set-selections
apt export DEBIAN_FRONTEND=noninteractive install ldap-utils slapd -y


cat > install.ldif << 'EOF'
dn: ou=users,dc=enterprisecoding,dc=local
objectClass: organizationalUnit
ou: Users

dn: ou=groups,dc=enterprisecoding,dc=local
objectClass: organizationalUnit
ou: Groups

dn: uid=rabbitmq,ou=users,dc=enterprisecoding,dc=local
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
cn: rabbitmq
uid: rabbitmq
uidNumber: 16859
gidNumber: 100
homeDirectory: /home/rabbitmq
loginShell: /bin/bash
gecos: rabbitmq
userPassword: {SSHA}S0+K1dQOUskDXl8QvTBaBIEwc0dx8wXZ
shadowLastChange: 0
shadowMax: 0
shadowWarning: 0

dn: uid=kursiyer,ou=users,dc=enterprisecoding,dc=local
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
cn: kursiyer
uid: kursiyer
uidNumber: 16849
gidNumber: 100
homeDirectory: /home/kursiyer
loginShell: /bin/bash
gecos: kursiyer
userPassword: {SSHA}S0+K1dQOUskDXl8QvTBaBIEwc0dx8wXZ
shadowLastChange: 0
shadowMax: 0
shadowWarning: 0
EOF

ldapadd -x -W -D "cn=admin,dc=enterprisecoding,dc=local" -w enterprisecoding -f install.ldif

rm -f install.ldif