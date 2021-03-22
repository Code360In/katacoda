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

echo "Örnek uygulama hazırlanıyor..."

git clone --depth 1 https://github.com/SonarSource/sonar-scanning-examples.git /tmp/ornekler/ 2>/dev/null &> /dev/null

mv /tmp/ornekler/sonarqube-scanner-ant ~/uygulama 2>/dev/null &> /dev/null
rm -f ~/uygulama/README.md 2>/dev/null &> /dev/null
rm -f ~/uygulama/build.xml 2>/dev/null &> /dev/null
rm -rf /tmp/ornekler/ 2>/dev/null &> /dev/null

cat >> ~/uygulama/build.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<project name="Ant için SonarQube Tarayıcı ile analiz edilen basit bir proje" default="all" basedir="." xmlns:sonar="antlib:org.sonar

  <!-- ========= Projenin ana özelliklerinin tanımı ========= -->
  <property name="src.dir" value="src" />
  <property name="build.dir" value="target" />
  <property name="classes.dir" value="${build.dir}/classes" />

  <!-- SonarQube genel özellikl tanımları (bu tanımlar komut satırından da verilebilir) -->
  <property name="sonar.host.url" value="http://localhost:9000" />

  <!-- Sonar özellik tanımları -->
  <property name="sonar.projectKey" value="com.enterprisecoding:sonarqube-scanner-ant" />
  <property name="sonar.projectName" value="Ant SonarQube Scanner Kullanim Ornegi" />
  <property name="sonar.projectVersion" value="1.0" />
  <property name="sonar.sources" value="src" />
  <property name="sonar.binaries" value="target" />
  <property name="sonar.sourceEncoding" value="UTF-8" />

  <!-- ========= clean, compile, ... gibi klasik ant hedefleri tanımları ========= -->
  <target name="clean">
    <delete dir="${build.dir}" />
  </target>

  <target name="init">
    <mkdir dir="${build.dir}" />
    <mkdir dir="${classes.dir}" />
  </target>

  <target name="compile" depends="init">
    <javac srcdir="${src.dir}" destdir="${classes.dir}" fork="true" debug="true" includeAntRuntime="false" />
  </target>

  <!-- ========= Ant için SonarQube Scanner hedef tanımı ========= -->
  <target name="sonar" depends="compile">
    <taskdef uri="antlib:org.sonar.ant" resource="org/sonar/ant/antlib.xml">
      <classpath path="/opt/sonarqube-ant/sonarqube-ant-task-*.jar" />
    </taskdef>

    <!-- Ant için SonarQube Scanner analizini başlat -->
    <sonar:sonar />
  </target>

  <!-- all için hedef tanımı -->
  <target name="all" depends="clean,compile,sonar" />

</project>
EOF

echo "SonarQube'ün hazır olması bekleniyor..."
while [[ "$(curl -u admin:admin -X POST -s -o /dev/null -w ''%{http_code}'' http://localhost:9000/api/system/health)" != "200" ]]
do 
   printf '.'
   sleep 5
done 

curl -X POST -u admin:admin 'http://localhost:9000/api/users/change_password?login=admin&password=enterprisecoding&previousPassword=admin' 2>/dev/null &> /dev/null

echo ""
echo "Etkileşimli ortam kullanıma hazır..."