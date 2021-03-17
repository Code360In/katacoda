# Shovel Test'i

**RabbitMQ01** segmesi üzerinden açılan yönetim arayüzüne geçiş yapın. **Exchanges** segmesine geçiş yapın ve **lab.shovel.ex.kaynak**'i açın. **Publish message** bölümünde **Payload** alanına aşağıdaki değeri yazın.

`Enterprisecoding rabbitmq eğitimi örnek shovel mesajı`{{copy}}

**Publish message** butonuna basarak mesajı yayınlayın. **Message published.** mesajını aldığınızı teyit edin. **Overview** bölümünde mesaja ilişkin **publish (in)** ve **publish (out)** grafiği oluştuğunu teyit edin.

**Queues** segmesine geçiş yapın. Burada listenen **lab.shovel.queue.kaynak* queue'su adına tıklayarak detay sayfasına geçiş yapın. **Message rates** sayfasında mesaj hareketine dair grafiği inceleyin.

**RabbitMQ02** segmesi üzerinden açılan yönetim arayüzüne geçiş yapın. **Exchanges** segmesine geçiş yapın ve **lab.shovel.ex.hedef** exchange'i adına tıklayın. Açılan detay sayfasında mesaj hareketine dair grafiği inceleyin.

 **Queues** segmesine geçiş yapın. Burada listenen **lab.shovel.queue.hedef** queue'su için de **Messages** grubunda **Ready** başlığı altında bir mesaj olduğun teyit edin.