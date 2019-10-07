# Linux Container Başlatma

LXD/LXC kurulumu ardından çalışan Linux Container'larını listeleyin;

`lxc list`{{execute}}

Gördüğünüz gibi henüz çalışan bir Linux Container'ı bulunmuyor. Aşağıdaki komutu kullanarak güncel Alpine Linux container'ını başlatın;

`lxc launch images:alpine/edge my-alpine`{{execute}}

Gerekli imajın indirilerek başlatılması ardından imaj listesini yeniden incelediğinizde `my-alpine` isimli container'ın çalışır durumda olduğunu göreceksiniz;

`lxc list`{{execute}}

Şimdi sırada çalışır durumdaki `my-alpine` container'ı içerisinde bir shell oturumu başlatmakta. Alpine linux ile birlikte **ash** geldiği için `/bin/ash` komutunu çalıştırın;

`lxc exec my-alpine -- /bin/ash`{{execute}}

Container içerisinde ash oturumu başlattınız. Bulunduğunuz dizini kontrol edin;

`pwd`{{execute}}

Yeni bir text dosyası oluşturun;

`echo "Enterprisecoding'den Merhaba!" > merhaba.txt`{{execute}}

Dosyanın oluştuğunu kontrol edin;

`ls`{{execute}}

Container içerisindeki shell oturumunuz sonlandırın;

`exit`{{execute}}

Bulunduğunuz klasördeki dosyaları listeleyin;

`ls`{{execute}}

`merhaba.txt` dosyasının olmadığını göreceksiniz.
