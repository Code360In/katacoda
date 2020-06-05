# Konteyner Imajı Oluşturma

Docker yardımıyla iki farklı yöntem kullanarak konteyner imajı oluşturulabilir. Bu yöntemlerde ilkinde temel alınan konteyner imajı başlatılarak istenen işlemler gerçekleştirilir. Konteyner'ın istenen duruma gelmesi ardından güncel hali ile imaj oluşturulur. İkinci yöntemde ise istenen durum **Dockerfile** dosyasında tariflenir. 

Bu iki yöntemden ilki yeni başlayanlar için daha kolay olan yoldur. Öte yandan bu yöntem CI/CD süeçleri için otomasyona uygun değildir.

Takip eden adımlarda interaktif olarak bir Docker konteyner imajı oluşturmayı göreceksiniz.

## Temel imaj

Yeni bir konteyner imajı oluştururken temel olarak kullanılacak bir ata konteyner imajı seçilerek bunun üzerine inşa edilmesi en çok kullanılan yöntemdir.

Senaryomuzda, nginx dağıtımını baz olarak üzerine kendi dosyalarımızı ekleyerek yeni bir konteyner imajı oluşturacağız. İlk adımımız ata konteyner imajını yerele indirmek olacak;

`docker pull nginx:latest`{{execute}}

Yerelde yer alan imajları aşağıdaki komutla listeleyin;

`docker images`{{execute}}

Gelen listede **nginx:latest** imajının da yer aldığını göreceksiniz.

## Konteyner'ı Başlatma

Temel olarak kullanacağınız ata Nginx imajını yerele indirdikten sonra sırada bu imajı kullanarak yeni bir konteyner başlatmakta. Aşağıdaki komutu çalıştırın;

`docker container run -d --name nginx_base_konteyner -p 8000:80 nginx:latest`{{execute}}

Bu komut **nginx_base_konteyner** adıyla atıfta bulunabileceğiniz bir konteyner ayağa kaldırarak 80 portunu ana makinede 8000 portu üzerinden erişime açacaktır. Konteyner başladıktan sonra aşağıdaki komut çalıştırın;

`docker container exec -it nginx_base_konteyner /bin/bash`{{execute}}

Bu komut **nginx_base_konteyner** içerisinde bir bash oturumu başlatttı. Bu bash oturumu yeni konteyner imajı için interaktif olarak gerekli komutları çalıştırmanıza olanak verecek.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
