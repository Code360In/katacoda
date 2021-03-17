# Hazırlık

## Exchange Oluşturma

Yan tarafta yer alan **RabbitMQ Management UI** segmesi üzerinden yönetim arayüzünü açın.
Açılan arayüzde `enterprisecoding`{{copy}} kullanıcı adı ve şifresi ile giriş yapın.

Yönetim arayüzünde **Exchanges** segmesine geçiş yapın ve **Add a new exchange** bölümünü açın.

Açılan bölümde **Name** alanına `lab.ex.direct.buggy`{{copy}} değerini yazın. **Type** alanında **direct** değerini seçin ve **Add exchange** butonuna basın.

Exchange listesinde yeni oluşturduğunuz exchange'in olduğunu teyit edin.

## Queue Oluşturma

Yönetim arayüzünde **Queues** segmesine geçiş yapın ve **Add a new queue** bölümünü açın.

Açılan bölümde **Name** alanına `lab.queue.is-emirleri.personel.baslama`{{copy}} değerini yazın ve **Add queue** butonuna basın.

Queue listesinde yeni oluşturduğunuz queue'un olduğunu teyit edin.

Aynı ekranda **Name** alanına `lab.queue.is-emirleri.personel.ayrilma`{{copy}} değerini yazın ve **Add queue** butonuna basın.

Queue listesinde yeni oluşturduğunuz queue'un olduğunu teyit edin.

## Binding Oluşturma

Yönetim arayüzünde **Exchanges** segmesine geçiş yapın. **lab.ex.direct.buggy** exchange'i açın ve **Bindings** bölümünü açın.

Açılan bölümde **Add binding from this exchange** alanına **To queue** değerine `lab.queue.is-emirleri.personel.baslama`{{copy}} yazın. **Routing key** alanına `personel.is-emri.baslama`{{copy}} değerini yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

Açılan bölümde **Add binding from this exchange** alanına **To queue** değerine **lab.queue.is-emirleri.personel.ayrilma** yazın. **Routing key** alanına `personel.is-emri.ayrilma`{{copy}} değerini yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

## Mesaj Yayınlama

Yönetim arayüzünde **Exchanges** segmesine geçin. **lab.ex.direct.buggy** exchange'i açın. Bu sayfada yer alan **Publish message** bölümünü açın. **Payload** alanına aşağıdaki içeriği yazın;

`Enterprisecoding rabbitmq eğitimi örnek firehose tracer mesajı`{{copy}}

**Routing key** alanına aşağıdaki değeri yazın;

`personel.isemri.baslama`{{copy}}

**Publish message** butonuna basarak mesajı yayınlayın. 
**Message published, but not routed.** mesajını aldığınızı teyit edin. Kuyrukları kontrol ederek mesajın ulaşmadığını teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.