# Rabbitmq Diagnostics

Aşağıdaki komutla RabbitMQ'un çalışır durumda olup olmadığını kontrol edin;

`rabbitmq-diagnostics check_running`{{execute}}

Aşağıdaki komutu çalıştırarak RabbitMQ host process'inin ayakta olup olmadığını kontrol edin;

`rabbitmq-diagnostics ping`{{execute}}

Aşağıdaki komutla RabbitMQ durumunu kontrol edin;

`rabbitmq-diagnostics status`{{execute}}

Komut çıktısını kontrol ederek;

* Bir alarm oluşun oluşmadığını görün.
* RabbitMQ data dizinini tespit edin.
* Aktif eklentilerin hangi dizinde yer aldığını tespit edin.
* Log dosyalarının yerini tespit edin.
* Dinlenen portları tespit edin.

Aşağıdaki komutla RabbitMQ'da bir alarm durumu olup olmadığını kontrol edin;

`rabbitmq-diagnostics alarms`{{execute}}

Aşağıdaki listeners'a ait bilgileri kontrol edin;

`rabbitmq-diagnostics listeners`{{execute}}

Listerner port'larına erişilebildiğini kontrol edin;

`rabbitmq-diagnostics check_port_connectivity`{{execute}}

Yönetim arayüzüne giderek **guest** kullanıcı adı ve şifresi ile artık giriş yapamadığınızı teyit edin.

Aşağıdaki komutla Observer'ı başlatın;

`rabbitmq-diagnostics observer`{{execute}}

**q** tuşuna basarak uygulamayı sonlandırın.