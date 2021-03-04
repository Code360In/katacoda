# Firehose ile Hata Ayıklama

Yönetim arayüzünde **Exchanges** segmesine geçin. **lab.ex.direct.buggy** exchange'i açın. Bu sayfada yer alan **Publish message** bölümünü açın. **Payload** alanına aşağıdaki içeriği yazın;

`Enterprisecoding rabbitmq eğitimi örnek firehose tracer mesajı`

**Routing key** alanına aşağıdaki değeri yazın;

`personel.isemri.baslama`

**Publish message** butonuna basarak mesajı yayınlayın. 

**Message published, but not routed.** mesajını aldığınızı teyit edin.

**Queues** segmesine geçiş yapın. Burada listenen kuyruklardan **lab.queue.firehose.published** kuyruğunda hazır durumda 1 mesaj olduğunu teyit edin.

Listede **lab.queue.firehose.published** adına tıklayarak kuyruk sayfasına geçiş yapın.
Açılan sayfa yer alan **Overview** bölündeki **Queued messages** grafiğinde 1 mesajı gösterildiğini teyit edin. 
Sayfadaki **Get messages** bölümünü açın. Bu bölümde yer alan **Get message(s)** butonuna basarak kuyruktaki mesajı okuyun. Öz önce yayınladığınız mesajın geldiğini teyit edin. Yazdığınız mesaja ek olarak **Properties** bölümünde **headers** başlığı altında kuyruk hakkında ek meta veriler olduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.