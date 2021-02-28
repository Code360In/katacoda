# Komut Satırından Mesaj Yayınlama

Aşağıdaki komutu çalıştırarak rabbitmadmin uygulamasını kullanarak mesaj yayınlayın;

```bash
rabbitmqadmin -u enterprisecoding -p enterprisecoding publish --vhost=default exchange=headersExchange payload="Enterprisecoding rabbitmq eğitimi ikinci örnek direct exchange mesajı" routing_key="" properties='{ "headers": {"modul": "personel", "tur": "is-emri", "islem": "ayrilma"}}'
```{{execute}}

Önceki adımda tariflendiği şekilde mesajın kuyruklara teslim edildiğini teyit edin.