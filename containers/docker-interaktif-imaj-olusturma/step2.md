# Ata Imajı Özelleştirme

Ata imajı özelleştirme için başlattıktan sonra elinizde çalışan bir Nginx konteyner'ı bulunuyor. Aşağıdaki komutu çalıştırın;

`echo "Enterprisecoding Nginx docker imajından merhaba!" > /usr/share/nginx/html/index.html`{{execute}}

Bu komut ile ata konteyner imajı içerisinde **/usr/share/nginx/html/index.html** adresinde yeni bir dosya oluşturdunuz. Aşağıdaki linke tıklayarak bu dosyanın Nginx tarafından sunulduğunu görebilirsiniz;

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

Aşağıdaki komutla ata konteynerı shell oturumunu sonlandırın;

`exit`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
