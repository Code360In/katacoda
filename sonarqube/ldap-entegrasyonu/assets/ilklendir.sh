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

Etkileşimli ortam hazırlanıyor...
EOF

sudo sysctl -w vm.max_map_count=262144 2>/dev/null &> /dev/null
sudo add-apt-repository ppa:openjdk-r/ppa -y 2>/dev/null &> /dev/null
sudo apt install -y zip 2>/dev/null &> /dev/null

cat >> /etc/sysctl.conf <<EOF
vm.max_map_count=262144
fs.file-max=65536
ulimit -n 65536
ulimit -u 4096
EOF

cat >> /etc/security/limits.conf <<EOF
sonarqube   -   nofile   65536
sonarqube   -   nproc    4096
EOF

apt-get update 2>/dev/null &> /dev/null

echo "OpenJDK 11 kuruluyor..."
apt-get install openjdk-11-jdk -y 2>/dev/null &> /dev/null

echo "PostgreSQL kuruluyor..."
(wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -) 2>/dev/null &> /dev/null
(echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list)  2>/dev/null &> /dev/null

sudo apt install -y postgresql postgresql-contrib 2>/dev/null &> /dev/null
sudo systemctl enable postgresql 2>/dev/null &> /dev/null
sudo systemctl start postgresql 2>/dev/null &> /dev/null

echo "SonarQube veritabanı kullanıcısı hazırlanıyor..."
sudo -u postgres createuser sonar 2>/dev/null &> /dev/null
sudo -u postgres psql -c "ALTER USER sonar WITH ENCRYPTED PASSWORD 'enterprisecoding';" 2>/dev/null &> /dev/null
sudo -u postgres psql -c "CREATE DATABASE sonarqube OWNER sonar;" 2>/dev/null &> /dev/null
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar;" 2>/dev/null &> /dev/null
systemctl restart postgresql 2>/dev/null &> /dev/null

echo "SonarQube kuruluyor..."

sudo curl -o /tmp/sonarqube.zip https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.7.1.42226.zip 2>/dev/null &> /dev/null
sudo unzip /tmp/sonarqube.zip -d /opt/ 2>/dev/null &> /dev/null
mv /opt/sonarqube-8.7.1.42226/ /opt/sonarqube 2>/dev/null &> /dev/null
sudo groupadd sonar 2>/dev/null &> /dev/null
sudo useradd -c "SonarQube - User" -d /opt/sonarqube/ -g sonar sonar 2>/dev/null &> /dev/null
sudo chown sonar:sonar /opt/sonarqube/ -R 2>/dev/null &> /dev/null

cat >> /opt/sonarqube/conf/sonar.properties <<EOF
sonar.jdbc.username=sonar
sonar.jdbc.password=enterprisecoding
sonar.jdbc.url=jdbc:postgresql://localhost/sonarqube
sonar.search.javaOpts=-Xmx512m -Xms512m -XX:+HeapDumpOnOutOfMemoryError
EOF

echo "SonarQube hizmeti başlatılıyor..."
cat >> /etc/systemd/system/sonarqube.service <<EOF
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking

ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop

User=sonar
Group=sonar
Restart=always

LimitNOFILE=65536
LimitNPROC=4096


[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload 2>/dev/null &> /dev/null
systemctl start sonarqube 2>/dev/null &> /dev/null

echo "SonarQube kullanıma hazır..."

echo "LDAP kuruluyor..."

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
DEBIAN_FRONTEND=noninteractive apt install ldap-utils slapd -y  2>/dev/null &> /dev/null

cat > install.ldif << 'EOF'
dn: ou=users,dc=enterprisecoding,dc=local
objectClass: organizationalUnit
ou: users
description: Users

dn: cn=sonarqube-app,ou=users,dc=enterprisecoding,dc=local
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: person
cn: sonarqube-app
sn: sonarqube-app
uid: sonarqube-app
userPassword: {SSHA}S0+K1dQOUskDXl8QvTBaBIEwc0dx8wXZ
mail: sonarqube@enterprisecoding.local

dn: cn=sonarqube-admin,ou=users,dc=enterprisecoding,dc=local
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: person
cn: sonarqube-admin
sn: sonarqube-admin
uid: sonarqube-admin
userPassword: {SSHA}S0+K1dQOUskDXl8QvTBaBIEwc0dx8wXZ
mail: sonarqube-admin@enterprisecoding.local

dn: cn=sonarqube-developer,ou=users,dc=enterprisecoding,dc=local
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: person
cn: sonarqube-developer
sn: sonarqube-developer
uid: sonarqube-developer
userPassword: {SSHA}S0+K1dQOUskDXl8QvTBaBIEwc0dx8wXZ
mail: sonarqube-developer@enterprisecoding.local

dn: ou=groups,dc=enterprisecoding,dc=local
objectClass: organizationalUnit
ou: groups
description: Groups

dn: ou=app,dc=enterprisecoding,dc=local
objectClass: organizationalUnit
ou: app
description: Uygulamalar

dn: ou=sonarqube,ou=app,dc=enterprisecoding,dc=local
objectClass: organizationalUnit
ou: rabbitmq
description: SonarQube Uygulaması

dn: cn=sonarqube-administrators,ou=sonarqube,ou=app,dc=enterprisecoding,dc=local
objectClass: top
objectClass: groupOfUniqueNames
objectClass: posixGroup
cn: sonarqube-administrators
description: SonarQube Administrators
uniqueMember: cn=sonarqube-admin,ou=users,dc=enterprisecoding,dc=local
EOF

ldapadd -x -D "cn=admin,dc=enterprisecoding,dc=local" -w enterprisecoding -f install.ldif  2>/dev/null &> /dev/null

rm -f install.ldif  2>/dev/null &> /dev/null

echo "LDAP kuruldu..."

echo "SonarQube'ün hazır olması bekleniyor..."
while [[ "$(curl -u admin:admin -X POST -s -o /dev/null -w ''%{http_code}'' http://localhost:9000/api/system/health)" != "200" ]]
do 
   printf '.'
   sleep 5
done 

curl -X POST -u admin:admin 'http://localhost:9000/api/users/change_password?login=admin&password=enterprisecoding&previousPassword=admin' 2>/dev/null &> /dev/null

echo ""
echo "Etkileşimli ortam kullanıma hazır..."