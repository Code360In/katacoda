# Yapılandırma Dosya Konumları

RabbitMQ uygulamasını durdurun;

`rabbitmqctl stop_app`{{execute}}

Aşağıdaki komutla **advanced.config** dosyasının adını **gelismis.yapilandirma** olarak güncelleyin;

`mv /etc/rabbitmq/advanced.config /etc/rabbitmq/gelismis.yapilandirma`{{execute}}

Aşağıdaki komutla **/etc/rabbitmq/rabbitmq-env.conf** dosyası oluşturun;

`echo "RABBITMQ_ADVANCED_CONFIG_FILE=/etc/rabbitmq/gelismis.yapilandirma" > /etc/rabbitmq/rabbitmq-env.conf`{{execute}}

RabbitMQ uygulamasını başlatın;

`rabbitmqctl start_app`{{execute}}

Aşağıdaki komutla RabbitMQ durumunu yeniden kontrol edin;

`rabbitmq-diagnostics status`{{execute}}

Komutun çıktısında **Config files** başlığı altında **/etc/rabbitmq/gelismis.yapilandirma** dosyasının listelendiğini teyit edin.