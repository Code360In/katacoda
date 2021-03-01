# RabbitMQ Control Uygulaması

Aşağıdaki komutla kurulumu kontrol edin;

`rabbitmqctl status`{{execute}}

Komut çıktısını kontrol ederek;
* Bir alarm oluşun oluşmadığını görün.
* RabbitMQ data dizinini tespit edin.
* Aktif eklentilerin hangi dizinde yer aldığını tespit edin.
* Log dosyalarının yerini tespit edin.
* Dinlenen portları tespit edin.

Aşağıdaki komut yardımıyla RabbitMQ üzerinde bulunan kuyrukları listeleyin;

`rabbitmqctl list_queues`{{execute}}

Aşağıdaki komut yardımıyla RabbitMQ'ya yapılan bağlantıları listeleyin;

`rabbitmqctl list_connections`{{execute}}

Aşağıdaki komut yardımıyla Kuyrukları dinleyenleri listeleyin;

`rabbitmqctl list_consumers`{{execute}}

Tüm ortam hakkında bilgi alın;

`rabbitmqctl environment`{{execute}}

Tanımlı kullanıcıları listeleyin;

`rabbitmqctl list_users`{{execute}}

Aşağıdaki komutla uygulamayı durdurun;

`rabbitmqctl stop_app`{{execute}}

Uygulamanın durması ardından RabbitMQ-Server hizmetinin durumunu aşağıdaki komutla kontrol edin;

`systemctl status rabbitmq-server`{{execute}}

RabbitMQ-Server hizmetinin çalışır durumda olduğunu teyit edin.

Aşağıdaki komutla RabbitMQ'yu sıfırlayın;

`rabbitmqctl reset`{{execute}}

Aşağıdaki komutla uygulamayı başlatın;

`rabbitmqctl start_app`{{execute}}

Tanımlı kullanıcıları yeniden listeleyin ve kullanıcıların gittiğini teyit edin;

`rabbitmqctl list_users`{{execute}}

Aşağıdaki komut yardımıyla RabbitMQ üzerinde bulunan kuyrukları yeniden listeleyin ve daha önce gördüğünüz kuyrukların olmadığını teyit edin;

`rabbitmqctl list_queues`{{execute}}

RabbitMQ uygulamasını ve hizmetini aşağıdaki komutla kapatın;

`rabbitmqctl shutdown`{{execute}}

RabbitMQ durumunu kontrol edin;

`rabbitmqctl status`{{execute}}

RabbitMQ-Server hizmetinin durumunu yeniden kontrol edin;

`systemctl status rabbitmq-server`{{execute}}

RabbitMQ-Server hizmetinin durmuş olduğunu teyit edin. Servisi yeniden başlatın;

`systemctl start rabbitmq-server`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.