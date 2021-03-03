# Komut Satırından Binding Oluşturma

Komut satırına geçiş yarapark aşağıdaki komutla **queue.lab.is-emirleri.personel.ayrilma** için binding'i tanımlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding declare binding --vhost=default source=ex.lab.topic destination=queue.lab.is-emirleri.personel.ayrilma routing_key="personel.is-emri.ayrilma"`{{execute}}

Benzer şekilde aşağıdaki komutla **queue.lab.is-emirleri.personel.tumu** için binding'i tanımlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding declare binding --vhost=default source=ex.lab.topic destination=queue.lab.is-emirleri.personel.tumu routing_key="personel.#.#"`{{execute}}

Yönetim arayüzüne geçin. Yönetim arayüzünde **Exchanges** segmesine geçiş yapın ve **Bindings** bölümünü açın. Binding'in oluşturulduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.