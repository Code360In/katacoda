# SonarQube Kurulumu

Kurulumunu yapmak üzere aşağıdaki komutla SonarQube'ü geçici dizin altına indirin;

`sudo curl -o /tmp/sonarqube.zip https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.7.1.42226.zip`{{execute}}

İndirdiğiniz dosyayı /opt dizini altına ayıklayın;

`sudo unzip /tmp/sonarqube.zip -d /opt/`{{execute}}

## Servis Kullanıcı ve Grubu

Güvenlik açısından sonarqube hizmetini düşük yetkili bir kullanıcı ile kullanmalısınız. Bu amaçla aşağıdaki komutla sonar grubunu oluşturun;

`sudo groupadd sonar`{{execute}}

Aşağıdaki komutla sonar grubuna dahil olacak şekilde sonar kullanıcısını oluşturun;

`sudo useradd -c "SonarQube - User" -d /opt/sonarqube/ -g sonar sonar`{{execute}}

**/opt/sonarqube/** dizini ve altının sahibini sonar kullanıcısı olarak değiştirin;

`sudo chown sonar:sonar /opt/sonarqube/ -R`{{execute}}

## SonarQube Yapılandırması

Kurulum ardımdan SonarQube'ün önceki adımlarda oluşturduğumuz veritabanını kullanabilmesi için gerekli yapılandırmalar yapılmalı. Bu amaçla aşağaki komutla **sonar.properties** dosyasına gerekli yapılandırmaları ekleyin;

```bash
cat >> /opt/sonarqube/conf/sonar.properties <<EOF
sonar.jdbc.username=sonar
sonar.jdbc.password=enterprisecoding
sonar.jdbc.url=jdbc:postgresql://localhost/sonarqube
sonar.search.javaOpts=-Xmx512m -Xms512m -XX:+HeapDumpOnOutOfMemoryError
EOF
```{{execute}}

## SonarQube Hizmetinin Yapılandırması

Yukarıdaki işlemler ardından sırada SonarQube'u hizmet olarak yapılandırmakta. Bu amaçla aşağıdaki komut ve içerikle **sonarqube.service** dosyasını oluşturun;

```bash
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
```{{execute}}

Servisin algılanması için aşağıdaki komutu çalıştırın;

`systemctl daemon-reload`{{execute}}

Servisi aktive edin;

`systemctl enable sonarqube`{{execute}}

Son olarak servisi başlatın;

`systemctl start sonarqube`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.