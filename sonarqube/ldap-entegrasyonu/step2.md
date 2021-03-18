# Ön Gereksinimler

## PostgreSQL Veritabanı Kurulumu

PostgreSQL kurulumu yapabilmek için öncelikle PostgreSQL depolarına güvenmek gereklidir. Aşağıdaki komutla işletim sisteminin PostgreSQL GPG anahtarına güvenmesini sağlayın;

`wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -`{{execute}}

Bu işlem ardında aşağıdaki komutla 

```bash
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
```{{execute}}

Hazırlıklar ardından aşağıdaki komutla PostgreSQL kurulumunu yapın;

`sudo apt install -y postgresql postgresql-contrib`{{execute}}

Kurulumun başarılı olduğunu aşağıdaki komutla kontrol edebilirsiniz;

`sudo -u postgres psql -c "SELECT version();"`{{execute}}

PostgreSQL hizmetini aktif duruma getirin;

`sudo systemctl enable postgresql`{{execute}}

PostgreSQL hizmetini başlatın;

`sudo systemctl start postgresql`{{execute}}

SonarQube için bir veritabanı kullanıcısı oluşturun;

`sudo -u postgres createuser sonar`{{execute}}

Oluşturduğunuz sonar kullanıcısına **enterprisecoding** şifresini tanımlayın;

`sudo -u postgres psql -c "ALTER USER sonar WITH ENCRYPTED PASSWORD 'enterprisecoding';"`{{execute}}

PostgreSQL üzerinde sahibi sonar kullanıcısı olacak şekilde **sonarqube** veritabanını oluşturun;

`sudo -u postgres psql -c "CREATE DATABASE sonarqube OWNER sonar;"`{{execute}}

Bu veritabanı üzerinde sonar kullanıcısına tüm yetkileri tanımlayın;

`sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar;"`{{execute}}

PostgreSQL hizmetini yeniden başlatın;

`systemctl restart postgresql`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.