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

echo "SonarQube başlatıldı..."

echo "SonarQube'ün hazır olması bekleniyor..."
while [[ "$(curl -u admin:admin -X POST -s -o /dev/null -w ''%{http_code}'' http://localhost:9000/api/system/health)" != "200" ]]
do 
   printf '.'
   sleep 5
done 

curl -X POST -u admin:admin 'http://localhost:9000/api/users/change_password?login=admin&password=enterprisecoding&previousPassword=admin' 2>/dev/null &> /dev/null

git clone https://github.com/SonarSource/sonar-scanning-examples.git /tmp/ornekler/

mv /tmp/ornekler/sonarqube-scanner ~/uygulama
rm -f ~/uygulama/README.md

echo ""
echo "Etkileşimli ortam kullanıma hazır..."