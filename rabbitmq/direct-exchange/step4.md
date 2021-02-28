# Komut Satırından Binding Oluşturma

Komut satırına geçiş yarapark aşağıdaki komutla ikinci binding'i tanımlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding declare binding --vhost=default source=directExchange destination=ayrilma-is-emirleri routing_key="personel.is-emri.ayrilma"`{{execute}}

Yönetim arayüzüne geçin. Yönetim arayüzünde **Exchanges** segmesine geçiş yapın ve **Bindings** bölümünü açın. Binding'in oluşturulduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.