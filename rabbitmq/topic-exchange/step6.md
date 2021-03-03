# Komut Satırından Mesaj Yayınlama

Aşağıdaki komutu çalıştırarak rabbitmadmin uygulamasını kullanarak mesaj yayınlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding publish --vhost=default exchange=lab.ex.topic routing_key="personel.is-emri.ayrilma" payload="Enterprisecoding rabbitmq eğitimi ikinci örnek direct exchange mesajı"`{{execute}}

Önceki adımda tariflendiği şekilde mesajın kuyruklara teslim edildiğini teyit edin.