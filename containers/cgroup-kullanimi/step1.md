# Gerekli Paketlerin Kurulumu

CGroup kullanımı için sağ bölümde yer alan ubuntu ortamı hazırlanmıştır. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## CGroup

CGroup, CPU, RAM ve Disk I/O gibi sistem kaynaklarını limitlemeye olanak sağlayan bir Kernel özelliğidir. Orjinali Google tarafından geliştirilen CGroup Ocak 2008'de yayınlanın Linux Kernel 2.6.24 ile açık kaynak olarak genel kullanıma sunulmuştur. Aşağıdaki adımlarda CGroup kurulum ve kullanımını deneyimleyeceksiniz.

Senaryomuzda bir CGroup oluşturarak process'leri limitlemeyi deneyimleyeceksiniz.

## Senaryo

CGroup sistem kaynaklarının process'ler özelince limitlenmesi üzerine kurgulanmıştır. Bu senaryoda, öncelikle gerekli paketleri kuracaksınız. Kurulum ardından bir cgroup oluşturacaksınız. Son olarak sistem kaynağı tüketen bir process'i oluşturduğunuz cgroup içerisinde başlatarak limitlerin uygulandığını gözlemleyeceksiniz.

## Gerekli Paketlerin Kurulması

CGroup kullanımı için **libcgroup1** ve **cgroup-tools** paketlerinin sistemde kurulu olması gerekmektedir. Aşağıdaki komutu çalıştırarak bu paketleri kurunuz;

`sudo apt install -y libcgroup1 cgroup-tools`{{execute}}

Sistem limitlerini uygulamak üzere aşağıdaki komutla örnek bir shell betiği oluşturun;

```bash
cat <<EOF >> ~/test.sh
#!/bin/sh

while [ 1 ]; do
        echo "Enterprisecoding cgroup senaryosundan merhaba!"
        sleep 20
done
EOF
```{{execute}}

**test.sh** betiği sonsuz bir döngü içerisinde ekrana `Enterprisecoding cgroup senaryosundan merhaba!` mesajını yazacaktır. Aşağıdaki komutu çalıştırarak bu betiği çalıştırılabilir yapınız;

`chmod +x ~/test.sh`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
