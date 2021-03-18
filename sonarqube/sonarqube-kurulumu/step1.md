# Ön Gereksinimler

Kuruluma başlarken öncelikli olarak gerekli kurulum ve yapılandırmalar gerçekleştirilmeşidir. Bu amaçla aşağıdaki adımları takip edin.

## Kernel Parametreleri ve Sistem Limitleri

Kurulumun yapılacağı makinede işletim sistemi düzeyinde kernel parametreleri ve sistem limitleri yapılandırılmalıdır. Bu amaçla aşağıdaki komutları terminalde çalıştırarak **sysctl.conf** dosyasına gerekli eklemeleri yapın;

```bash
cat >> /etc/sysctl.conf <<EOF

vm.max_map_count=262144
fs.file-max=65536
ulimit -n 65536
ulimit -u 4096
EOF
```{{execute}}

Aşağıdaki komutla **sysctl.conf** dosyasını görüntüleyerek sonuna yukarıdaki girdilerin eklendiğini teyit edin;

`cat /etc/sysctl.conf {{execute}}

Benzer şekilde aşağıdaki komutla **limits.conf** dosyasına ilerideki adımlarda oluşturacağınız sonarqube kullanıcısı için gerekli limit bilgilerini eklenyin;

```bash
cat >> /etc/security/limits.conf <<EOF
sonarqube   -   nofile   65536
sonarqube   -   nproc    4096
EOF
```{{execute}}

Aşağıdaki komutla **limits.conf** dosyasını görüntüleyerek sonuna yukarıdaki girdilerin eklendiğini teyit edin;

`cat /etc/security/limits.conf`{{execute}}

## Java Kurulumu

SonarQube java ile geliştirilmiş bir uygulama olduğu için sistemde Java 11 kurulumu olmalıdır. Aşağıdaki komutla kurulumu gerçekleştirin;

`apt-get install openjdk-11-jdk -y`{{execute}}

Kurulumu aşağıdaki komutla kontrol edin;

`java -version`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
