# İmaj Oluşturma ve Katmanlar

Bu adımda alpine 3.10.3 tabanlı bir Docker imajı oluşturacağız. İmaj için gerekli olan **Dockerfile** içeriğini aşağıdaki komutla görebilirsiniz;

`cat Dockerfile`{{execute}}

Aşağıdaki komutu kullanarak **enterprisecoding-sample** adı ile Docker imajını oluşturun;

`docker build -t enterprisecoding-sample .`{{execute}}

Komut çıktısını incelediğinizde ilk adımda indirdiğimiz alpine 3.10.3 imajına ait **965ea09ff2eb** katmanının oluşturulmak yerine yeniden kullanıldığını görebilirsiniz.

Alpine 3.10.3 imajına ait **965ea09ff2eb** katmanının yeniden kullanıldığını teyit için aşağıdaki komutu çalıştırın;

`docker history enterprisecoding-sample`{{execute}}

Listenen imajlardan ikincisinin **965ea09ff2eb**  olduğunu göreceksiniz.
