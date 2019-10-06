# Farklı Network Namespace'de Process Başlatma

Sırada bir önceki adımda oluşturduğumuz network namespace'i ile bir process başlatmakta. Bir Network Namespace'i altında process başlatmak için şu şekilde bir ifade kullanılır;

`ip netns exec [NAMESPACE ADI] [KOMUT]`

Aşağıdaki komutu çalıştırarak `enterprisecodingNNS` namespace'i ile bir bash oturumu başlatın;

`ip netns exec enterprisecodingNNS bash --rcfile <(echo "PS1=\"namespace[enterprisecodingNNS]> \"")`{{execute}}

Başlatılan bash oturumunda ip bilgilerini sorgulayın;

`ip a`{{execute}}

google'e ping atmayı deneyin;

`ping www.google.com`{{execute}}

`8.8.8.8` ip adresine ping atmayı deneyin;

`ping 8.8.8.8`{{execute}}

Gördüğünüz üzere, aynı network kablosu takılı olmayan bir bilgisayar gibi, oluşturduğumuz network namespace'inin dış dünya ile bir bağlantısı bulunmuyor. Bu network namespace'i ile çalışan process'lerin dış dünya ile etkileşimlerini sağlamak için gerekli yapılandırmaları yapmadığınız sürece bu şekilde bvağlantı kesik olarak kalacaktır.

`bash`'i sonlandırarak varsayılan network namespace'ine geri dönün;

`exit`{{execute}}

ip komutunu bu defa da varsayılan network namespace'inde çalıştırın;

`ip a`{{execute}}

benzer şekilde google'e ping atmayı deneyin;

`ping www.google.com`{{execute}}

Son olarak `8.8.8.8` ip adresine ping atmayı deneyin;

`ping 8.8.8.8`{{execute}}

gördüğünüz gibi varsayılan network namespace ile `enterprisecodingNNS` network namespace'leri arasında farklı network yapılandırmaları bulunmakta. `enterprisecodingNNS` network namespace'i içerisinde başlatılan bir process bu namespace'in yapılandırmasına tabi olarak çalışır.
