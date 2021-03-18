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

apt-get update

echo "OpenJDK 11 kuruluyor..."
apt-get install openjdk-11-jdk -y

echo "PostgreSQL kuruluyor..."
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list

sudo apt install -y postgresql postgresql-contrib
sudo systemctl enable postgresql
sudo systemctl start postgresql

echo "SonarQube veritabanı kullanıcısı hazırlanıyor..."
sudo -u postgres createuser sonar
sudo -u postgres psql -c "ALTER USER sonar WITH ENCRYPTED PASSWORD 'enterprisecoding';"
sudo -u postgres psql -c "CREATE DATABASE sonarqube OWNER sonar;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar;"
systemctl restart postgresql

echo "SonarQube kuruluyor..."

sudo curl -o /tmp/sonarqube.zip https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.7.1.42226.zip
sudo unzip /tmp/sonarqube.zip -d /opt/
mv /opt/sonarqube-8.7.1.42226/ /opt/sonarqube
sudo groupadd sonar
sudo useradd -c "SonarQube - User" -d /opt/sonarqube/ -g sonar sonar
sudo chown sonar:sonar /opt/sonarqube/ -R

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
systemctl daemon-reload
systemctl start sonarqube

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

echo "LDAP kuruldu..."
echo "Etkileşimli ortam kullanıma hazır..."