# Yönetim Arayüzünden Mesaj Yayınlama

Yönetim arayüzünde **Exchanges** segmesine geçin. **(AMQP default)** exchange'i açın. Bu sayfada yer alan **Publish message** bölümünü açın. **Payload** alanına aşağıdaki içeriği yazın;

`Enterprisecoding rabbitmq eğitimi örnek default exchange mesajı`

**Routing key** alanına **lab.queue.is-emirleri.personel.ayrilma** değerini yazın. **Publish message** butonuna basarak mesajı yayınlayın. 

**Message published.** mesajını aldığınızı teyit edin.
**Overview** bölümünde mesaja ilişkin **publish (in)** ve **publish (out)** grafiği oluştuğunu teyit edin.

**Queues** segmesine geçiş yapın. Burada listenen **lab.queue.is-emirleri.personel.baslama** ve **lab.queue.is-emirleri.personel.ayrilma** queue'ları için **Messages** grubunda **Ready** başlığını kontrol edin. Sadece **lab.queue.is-emirleri.personel.ayrilma** kuyruğunda hazır durumda bir mesaj olduğunu teyit edin.

Listede **lab.queue.is-emirleri.personel.ayrilma** adına tıklayarak kuyruk sayfasına geçiş yapın.
Açılan sayfa yer alan **Overview** bölündeki **Queued messages** grafiğinde 1 mesajı gösterildiğini teyit edin. 
Sayfadaki **Get messages** bölümünü açın. Bu bölümde yer alan **Get message(s)** butonuna basarak kuyruktaki mesajı okuyun. Öz önce yayınladığınız mesajın geldiğini teyit edin.