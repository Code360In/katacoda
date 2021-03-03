# Mesaj Yaşam Süresi

Yönetim arayüzünde **Queues** segmesine geçiş yapın ve **Add a new queue** bölümünü açın.

Açılan bölümde **Name** alanına **lab.queue.ttl** değerini yazın. 
**Arguments** bölümünden **Message TTL** seçin ya da **x-message-ttl** anahtarını elle yazın. Değer olarak **60000** yazın. Bu ifade kuyruğa alınan mesajların yaşam süresinin (TTL, __Time to live__) süresinin 60 saniye olacağını belirtecektir.

**Add queue** butonuna basın.

Queue listesinde yeni oluşturduğunuz queue'un olduğunu teyit edin

Kuyruk listesinden **lab.queue.ttl** kuyruğunun adına tıklayarak detay sayfasını açın. Detay sayfasında **Publish message** bölümüne açın ve aşağıdaki içeriği **Payload** bölümüne yazın;

`60 saniye sonra yok olacak örnek bir mesaj`

**Publish message** butonuna basarak mesajı kuyruğa bırakın. **Queued messages** bölümünde **ready** durumunda bir mesaj bulunduğunu teyit edin. 60 saniye sonra mesajın kendiğinde silindiğini teyit edin.


**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.