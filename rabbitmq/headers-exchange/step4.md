# Komut Satırından Binding Oluşturma

Komut satırına geçiş yarapark aşağıdaki komutla **personel-ayrilma-is-emirleri** için binding'i tanımlayın;

```bash
rabbitmqadmin -u enterprisecoding -p enterprisecoding declare binding --vhost=default source=headersExchange destination=personel-ayrilma-is-emirleri routing_key="" arguments='{"x-match": "all", "modul": "personel", "tur": "is-emri", "islem": "ayrilma"}'
```{{execute}}

Yönetim arayüzüne geçin. Yönetim arayüzünde **Exchanges** segmesine geçiş yapın ve **Bindings** bölümünü açın. Binding'in oluşturulduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.