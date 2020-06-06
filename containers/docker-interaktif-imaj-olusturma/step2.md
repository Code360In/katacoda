# Ata Imajı Özelleştirme

Ata imajı özelleştirme için başlattıktan sonra elinizde çalışan bir Nginx konteyner'ı bulunuyor. Aşağıdaki komutu çalıştırın;

`echo "Enterprisecoding Nginx docker imajindan merhaba!" > /usr/share/nginx/html/index.html`{{execute}}

Bu komut ile ata konteyner imajı içerisinde **/usr/share/nginx/html/index.html** adresinde yeni bir dosya oluşturdunuz. **8000 Portu** tabını açarak bu dosyanın Nginx tarafından sunulduğunu görebilirsiniz.

Aşağıdaki komutla ata konteynerı shell oturumunu sonlandırın;

`exit`{{execute}}

Aşağıdaki komutu çalıştırarak konteyner'ı durdurun;

`docker stop nginx_base_konteyner`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
