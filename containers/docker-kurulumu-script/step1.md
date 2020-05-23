# Gereksinimlerin Kurulumu

Docker kurulum ve kullanımı için sağ bölümde yer alan ubuntu ortamı hazırlanmıştır. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## Paket Gereksinimleri

Docker kurulum adımlarını kolaylaştırmak için bir kurulum betiği hazırlamıştır. Aşağıdaki komutu çalıştırarak Docker kurulumunu gerçekleştirebilirsiniz;

`wget -qO- https://get.docker.com | sh`{{execute}}

Bu komut Docker kurulum script'ini yerele indirerek shell oturumunda indirilen scripti çalıştırarak kurulumu gerçekleştirecektir.

## Sudo'suz Docker

Kurulum ardından varsayılanda Docker komutları `sudo` ile çalışmaktadır. Bunun yerine komutları non-root olarak çalıştırmak isterseniz aşağıdaki şekilde kullanıcısını docker grubuna dahil etmelisiniz.

`sudo usermod -aG docker ${USER}`{{execute}}

Değişikliklerin etkili olması için yeniden giriş yapın;

`su - ${USER}`{{execute}}

İşlemleri teyit edin;

`docker info`{{execute}}


Son olarak kurulum ve kullanımını kontrol etmek amacıyla aşağıdaki komutu çalıştırarak hello-world imajının Docker Hub'dan çekilerek çalıştırılmasını sağlayın;

`docker run hello-world`{{execute}}