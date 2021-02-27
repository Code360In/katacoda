# Management Eklentisi Kurulumu

Aşağıdaki komutla kurulumu kontrol edin;

`rabbitmqctl status`{{execute}}

Aşağıdaki komut yardımıyla RabbitMQ yönetim eklentisini kurun;

`rabbitmq-plugins enable rabbitmq_management`{{execute}}

Kurulum ardından **RabbitMQ Management UI** segmesi üzerinden yönetim arayüzünü açarak inceleyin.

Kullanıcı adı ve şifre alanına **guest** değerini vererek giriş yapmayı deneyin. **User can only log in via localhost** hata mesajı aldığınızı teyi edin.

Bu hata mesajı **guest** kullanıcısının sadece yerelden giriş yapabileceğini belirtmektedir.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.