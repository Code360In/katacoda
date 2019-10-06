# Farklı Network Namespace'de Process Başlatma

Sırada bir önceki adımda oluşturduğumuz network namespace'i ile bir process başlatmakta. Aşağıdaki komutu çalıştırarak `enterprisecodingNNS` namespace'i ile bir bash oturumu başlatın;

`sudo ip netns exec enterprisecodingNNS bash`{{execute}}

Başlatılan bash oturumunda ip bilgilerini sorgulayın;

`ip a`{{execute}}

google'e ping atmayı deneyin;

`ping www.google.com`{{execute}}

`8.8.8.8` ip adresine ping atmayı deneyin;

`ping 8.8.8.8`{{execute}}

Gördüğünüz üzere, aynı network kablosu takılı olmayan bir bilgisayar gibi, oluşturduğumuz network namespace'inin dış dünya ile bir bağlantısı bulunmuyor.

`bash`'i sonlandırarak varsayılan network namespace'ine geri dönün;

`exit`{{execute}}

ip komutunu bu defa da varsayılan network namespace'inde çalıştırın;

`ip a`{{execute}}

benzer şekilde google'e ping atmayı deneyin;

`ping www.google.com`{{execute}}

Son olarak `8.8.8.8` ip adresine ping atmayı deneyin;

`ping 8.8.8.8`{{execute}}

gördüğünüz gibi varsayılan network namespace ile `enterprisecodingNNS` network namespace'leri arasında farklı network yapılandırmaları bulunmakta. `enterprisecodingNNS` network namespace'i içerisinde başlatılan bir process bu namespace'in yapılandırmasına tabi olarak çalışır.
