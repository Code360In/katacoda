# Komut Satırından Binding Oluşturma

Komut satırına geçiş yarapark aşağıdaki komutla **personel-ayrilma-is-emirleri** için binding'i tanımlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding declare binding --vhost=default source=topicExchange destination=personel-ayrilma-is-emirleri routing_key="personel.is-emri.ayrilma"`{{execute}}

Benzer şekilde aşağıdaki komutla **personel-mesajlari** için binding'i tanımlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding declare binding --vhost=default source=topicExchange destination=personel-mesajlari routing_key="personel.#.#"`{{execute}}

Yönetim arayüzüne geçin. Yönetim arayüzünde **Exchanges** segmesine geçiş yapın ve **Bindings** bölümünü açın. Binding'in oluşturulduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.