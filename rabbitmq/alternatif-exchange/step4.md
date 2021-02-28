# Yönetim Arayüzünden Mesaj Yayınlama

Yönetim arayüzünde **Exchanges** segmesine geçin. **personelExchange** exchange'i açın. Bu sayfada yer alan **Publish message** bölümünü açın. **Payload** alanına aşağıdaki içeriği yazın;

`Enterprisecoding rabbitmq eğitimi örnek alternatif exchange mesajı`

**Routing key** alanına aşağıdaki değeri yazın;

`personel.is-emri.baslama`

**Publish message** butonuna basarak mesajı yayınlayın. 

**Message published.** mesajını aldığınızı teyit edin.
**Overview** bölümünde mesaja ilişkin **publish (in)** ve **publish (out)** grafiği oluştuğunu teyit edin.

**Queues** segmesine geçiş yapın. Burada listenen **personel-baslama-is-emirleri**, **personel-alternatif** ve **personel-ayrilma-is-emirleri** queue'ları için **Messages** grubunda **Ready** başlığını kontrol edin. Sadece **personel-baslama-is-emirleri** kuyruğunda hazır durumda bir mesaj olduğunu teyit edin.

Listede **personel-baslama-is-emirleri** adına tıklayarak kuyruk sayfasına geçiş yapın.
Açılan sayfa yer alan **Overview** bölündeki **Queued messages** grafiğinde 1 mesajı gösterildiğini teyit edin. 
Sayfadaki **Get messages** bölümünü açın. Bu bölümde yer alan **Get message(s)** butonuna basarak kuyruktaki mesajı okuyun. Öz önce yayınladığınız mesajın geldiğini teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.