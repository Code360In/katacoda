# Chroot Test edilmesi

Dizin oluşturulması ardından chroot sistem çağrısının nasıl çalıştığını aşağıdaki komutla deneyimleyebilirsiniz;

`chroot /home/enterprisecoding/ /bin/bash`

Bu komut `/home/enterprisecoding/` kök dizin olacak şekilde yeni bir bash oturumu başlatacaktır. Aşağıdaki komut yardımıyla bulunduğunuz dizini kontrol edin;

`pwd`{{execute}}

Kök dizine bağlı alt dizinleri listeleyin;

`ls`{{execute}}
