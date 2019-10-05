# Chroot Test edilmesi

Dizin oluşturulması ardından Gerçek dosya sisteminde bulunduğunuz dizini sorgulayın;

`pwd`{{execute}}

chroot sistem çağrısının nasıl çalıştığını aşağıdaki komutla deneyimleyebilirsiniz;

`chroot /home/enterprisecoding/ /bin/bash`{{execute}}

Bu komut `/home/enterprisecoding/` kök dizin olacak şekilde yeni bir bash oturumu başlatacaktır. Aşağıdaki komut yardımıyla bulunduğunuz dizini kontrol edin;

`pwd`{{execute}}

Kök dizine bağlı alt dizinleri listeleyin;

`ls`{{execute}}

`ls` uygulaması sanal kök dosya sisteminde `/bin` altında bulunduğu için çalıştığını gördünüz. Öte yandan bulunmayan `mkdir` ya da benzeri komutlar için **Command not found** hatası alınacaktır. Bunu görmek için aşağıdaki komutu deneyin ;

`mkdir`{{execute}}

chroot jail'den çıkmak için aşağıdaki komut çalıştırın;

`exit`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
