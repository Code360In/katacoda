# Konteyner Başlatma

Bir önceki adımda konteyner imajlarını yerele nasıl indirebileceğinizi görmüştünüz. Bu adımda ise bir konteyner'ı nasıl başlatabileceğinizi göreceksiniz.

Aşağıdaki komut çalıştırın;

`docker run redis`{{execute}}

Bu komut **redis** konteyner imajını kullanarak bir konteyner başlatacak ve ilgili process'e gitmenizi sağlayacak.

Gördüğünüz gibi yerelde kurulu olmamasına rağmen redis başlatıldı ve konsolda çıktısını görmektesiniz.

<kbd>Ctrl</kbd>+<kbd>C</kbd> ile redis uygulamasını ve dolayısıyla da konteyner'ı sonlandırabilirsiniz.

`echo "Konsola geri dönüldü"`{{execute interrupt}}


## Konteyner'ı Hizmet Olarak Başlatma

Pek çok kullanım senaryosunda başlatılan konteyner'ın arkaplanda çalışır olması istenmektedir. Bu adımda konteyner'ı hizmet olarak başlatacaksınız.

Aşağıdaki komut çalıştırın;

`docker run -d --name redis-konteyner redis`{{execute}}

Öncekinden farklı olarak bu komutta kullandığımız `-d` parametresi sayesinde konteynar'ımız arkaplanda başlatılarak çalışan konteyner id'si çıktıda belirtilecektir.

Aktif olarak çalışan konteyner'ları aşağıdaki komutla listeleyebilirsiniz;

`docker ps`{{execute}}

Gelen listede az önce başlattığınız Konteyner'ı göreceksiniz.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
