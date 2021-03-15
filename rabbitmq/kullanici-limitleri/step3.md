# Kullanıcı Limitleme


Aşağıdaki komutla **uygulama1** kullanıcını maksimumda 2 bağlantı ve 2 kanal açabilmesine izin verin;

`rabbitmqctl set_user_limits "uygulama1" '{"max-connections": 2, "max-channels": 2, "max-queues": 50}'`{{execute}}

Yeniden aşağıdaki komutu çalıştırarak yük oluşturun;

`yuk-olustur`{{execute}}

Bu komut 1 dakika süre için RabbitMQ'ya yük oluşturacaktır.

Yönetim arayüzüne geçiş yaparak **uygulama1** kullanıcısı ile bağlantı ve kanal açıldığını teyit edin. Bir süre sonra **perf-test-producer-0**, **perf-test-producer-1** ve **perf-test-producer-2** bağlantılarının **flow** durumuna geçtiğini; **perf-test-consumer-0**, **perf-test-consumer-1**, **perf-test-consumer-2** bağlantılarının **running** durumda olduğunu teyit edin.  Benzer şekilde **Channels** bölümünde listelenen 3 kanalın **flow** durumuna girmediğini teyit edin.