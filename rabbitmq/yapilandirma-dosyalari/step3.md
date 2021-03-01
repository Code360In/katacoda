# Gelişmiş Yapılandırma

RabbitMQ uygulamasını durdurun;

`rabbitmqctl stop_app`{{execute}}

Aşağıdaki komutu kullanarak birinci adımda oluşturduğunuz **/etc/rabbitmq/rabbitmq.conf** dosyasını silin;

`rm -f /etc/rabbitmq/rabbitmq.conf`{{execute}}

RabbitMQ uygulamasını başlatın;

`rabbitmqctl start_app`{{execute}}

Aşağıdaki komutla RabbitMQ durumunu yeniden kontrol edin;

`rabbitmq-diagnostics status`{{execute}}

Komutun çıktısında **Config files** başlığı altının yeniden boş olduğunu teyit edin. **Listeners** başlığı altında **amqp** için **5672** portunun kullanıldığını teyit edin.

RabbitMQ uygulamasını yeniden durdurun;

`rabbitmqctl stop_app`{{execute}}

Aşağıdaki komutla **/etc/rabbitmq/advanced.config** dosyası oluşturun;

```bash
cat > /etc/rabbitmq/advanced.config <<EOF
[
  {rabbit, [
      {tcp_listeners, [5673]}
    ]
  }
].
EOF
```{{execute}}

RabbitMQ uygulamasını başlatın;

`rabbitmqctl start_app`{{execute}}

Aşağıdaki komutla RabbitMQ durumunu yeniden kontrol edin;

`rabbitmq-diagnostics status`{{execute}}

Komutun çıktısında **Config files** başlığı altın yeni oluşturduğunuz dosyanın yer aldığı teyit edin. **Listeners** başlığı altında **amqp** için yeniden **5673** portunun kullanıldığını teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
