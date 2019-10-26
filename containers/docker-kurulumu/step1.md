# Gereksinimlerin Kurulumu

Docker kurulum ve kullanımı için sağ bölümde yer alan ubuntu ortamı hazırlanmıştır. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## Paket Gereksinimleri

Docker kurulumuna başlarken öncelikle aşağıdaki gereksinimlerin sistemde kurulu olduğuna emin olun;

`sudo apt install -y apt-transport-https ca-certificates curl software-properties-common`{{execute}}

## Docker Deposunun Eklenmesi

Sıradaki adımda Docker paketlerinin yer aldığı Docker deposu kurulmalıdır. Aşağıdaki komutu çalıştırarak depoya ait GPG anahtarı eklenir;

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`{{execute}}

Ubuntu sürümüne özel Depo tanımı aşağıdaki komutla eklenir;

`sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`{{execute}}

Yeni eklenen Docker deposunda yer alan paketler için paket veritabanı güncellenir;

`sudo apt update`{{execute}}

Varsayılan ubuntu deposu yerine Docker deposundan kurulum yapılacağı aşağıdaki komutla teyit edilebilir;

`apt-cache policy docker-ce`{{execute}}

Bu komut aşağıdakine benzer bir çıktı üretecektir;

```bash
docker-ce:
  Installed: (none)
  Candidate: 5:19.03.4~3-0~ubuntu-xenial
  Version table:
     5:19.03.4~3-0~ubuntu-xenial 500
        500 https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
     ...
```
Çıktı bize kurulumun `https://download.docker.com/linux/ubuntu` deposundan yapılacağını söylemektedir.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
