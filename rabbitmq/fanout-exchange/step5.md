# Yönetim Arayüzünden Mesaj Yayınlama

Yönetim arayüzünde **Exchanges** segmesine geçin. **fanoutExchange** exchange'i açın. Bu sayfada  yer alan **Publish message** bölümünü açın. **Payload** alanına aşağıdaki içeriği yazın;

`Enterprisecoding rabbitmq eğitimi örnek fanout exchange mesajı`

**Publish message** butonuna basarak mesajı yayınlayın. 

**Message published.** mesajını aldığınızı teyit edin.
**Overview** bölümünde mesaja ilişkin **publish (in)** ve **publish (out)** grafiği oluştuğunu teyit edin.

**Queues** segmesine geçiş yapın. Burada listenen **fanoutQueue1** ve **fanoutQueue2** queue'ları için **Messages** grubunda **Ready** başlığı altında her iki queue için de birer mesaj olduğun teyit edin.

Listede **fanoutQueue1** adına tıklayarak kuyruk sayfasına geçiş yapın.
Açılan sayfa yer alan **Overview** bölündeki **Queued messages** grafiğinde 1 mesajı gösterildiğini teyit edin. 
Sayfadaki **Get messages** bölümünü açın. Bu bölümde yer alan **Get message(s)** butonuna basarak kuyruktaki mesajı okuyun. Öz önce yayınladığınız mesajın geldiğini teyit edin.

Yukarıdaki adımlar **fanoutQueue2** kuyruğu içinde tekrar ederek aynı mesajın bu kuyruğa da bırakıldığını teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.