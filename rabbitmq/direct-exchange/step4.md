# Komut Satırından Binding Oluşturma

Komut satırına geçiş yaparak aşağıdaki komutla ikinci binding'i tanımlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding declare binding --vhost=default source=lab.ex.direct destination=lab.queue.is-emirleri.personel.ayrilma routing_key="personel.is-emri.ayrilma"`{{execute}}

Yönetim arayüzüne geçin. Yönetim arayüzünde **Exchanges** segmesine geçiş yapın ve **Bindings** bölümünü açın. Binding'in oluşturulduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.