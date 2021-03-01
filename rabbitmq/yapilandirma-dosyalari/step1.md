# Yapılandırma dosyaları

Aşağıdaki komutla RabbitMQ durumunu kontrol edin;

`rabbitmq-diagnostics status`{{execute}}

Komutun çıktısında **Config files** başlığı altının boş olduğunu teyit edin. **Listeners** başlığı altında **amqp** için **5672** portunun kullanıldığını teyit edin.

RabbitMQ uygulamasını durdurun;

`rabbitmqctl stop_app`{{execute}}

Aşağıdaki komutla **/etc/rabbitmq/rabbitmq.conf** dosyası oluşturun;

```bash
cat > /etc/rabbitmq/rabbitmq.conf <<EOF
listeners.tcp.default = 5673
EOF
```{{execute}}

RabbitMQ uygulamasını başlatın;

`rabbitmqctl start_app`{{execute}}

Aşağıdaki komutla RabbitMQ durumunu yeniden kontrol edin;

`rabbitmq-diagnostics status`{{execute}}

Komutun çıktısında **Config files** başlığı altın yeni oluşturduğunuz dosyanın yer aldığı teyit edin. **Listeners** başlığı altında **amqp** için artık **5673** portunun kullanıldığını teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.