# Komut Satırından Binding Oluşturma

Komut satırına geçiş yarapark aşağıdaki komutla **lab.queue.is-emirleri.personel.ayrilma** için binding'i tanımlayın;

```bash
rabbitmqadmin -u enterprisecoding -p enterprisecoding declare binding --vhost=default source=lab.ex.headers destination=lab.queue.is-emirleri.personel.ayrilma routing_key="" arguments='{"x-match": "all", "modul": "personel", "tur": "is-emri", "islem": "ayrilma"}'
```{{execute}}

Yönetim arayüzüne geçin. Yönetim arayüzünde **Exchanges** segmesine geçiş yapın ve **Bindings** bölümünü açın. Binding'in oluşturulduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.