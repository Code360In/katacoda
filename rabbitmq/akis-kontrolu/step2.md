# Yük Oluşturma

Yan tarafta bulunan terminalde aşağıdaki komutu çalıştırarak yük oluşturun;

`yuk-olustur`{{execute}}

Bu komut 1 dakika süre için RabbitMQ'ya yük oluşturacaktır.

Yönetim arayüzüne geçiş yaparak bağlantı ve kanal açıldığını teyit edin. Bir süre sonra **perf-test-producer-0**, **perf-test-producer-1** ve **perf-test-producer-2** bağlantılarının **flow** durumuna geçtiğini; **perf-test-consumer-0**, **perf-test-consumer-1**, **perf-test-consumer-2** bağlantılarının **running** durumda olduğunu teyit edin.  Benzer şekilde **Channels** bölümünde listelenen 3 kanalın **flow** durumunda olduğunu teyit edin.