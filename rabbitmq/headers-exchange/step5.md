# Yönetim Arayüzünden Mesaj Yayınlama

Yönetim arayüzünde **Exchanges** segmesine geçin. **ex.lab.direct** exchange'i açın. Bu sayfada yer alan **Publish message** bölümünü açın. **Payload** alanına aşağıdaki içeriği yazın;

`Enterprisecoding rabbitmq eğitimi örnek headers exchange mesajı`

**Headers** alanına sırasıyla aşağıdaki anahtar-değer ikililerini yazın;

* **modul** - **personel**
* **tur** - **is-emri**
* **islem** - **baslama**


**Publish message** butonuna basarak mesajı yayınlayın. 

**Message published.** mesajını aldığınızı teyit edin.
**Overview** bölümünde mesaja ilişkin **publish (in)** ve **publish (out)** grafiği oluştuğunu teyit edin.

**Queues** segmesine geçiş yapın. Burada listenen **queue.lab.is-emirleri.personel.baslama** ve **queue.lab.is-emirleri.personel.ayrilma** queue'ları için **Messages** grubunda **Ready** başlığını kontrol edin. Sadece **queue.lab.is-emirleri.personel.baslama** kuyruğunda hazır durumda bir mesaj olduğunu teyit edin.

Listede **queue.lab.is-emirleri.personel.baslama** adına tıklayarak kuyruk sayfasına geçiş yapın.
Açılan sayfa yer alan **Overview** bölündeki **Queued messages** grafiğinde 1 mesajı gösterildiğini teyit edin. 
Sayfadaki **Get messages** bölümünü açın. Bu bölümde yer alan **Get message(s)** butonuna basarak kuyruktaki mesajı okuyun. Öz önce yayınladığınız mesajın geldiğini teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.