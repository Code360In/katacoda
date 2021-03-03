# Yük Oluşturma

Yan tarafta bulunan terminalde aşağıdaki komutu çalıştırarak yük oluşturun;

`yuk-olustur`{{execute}}

Bu komut 1 dakika süre için RabbitMQ'ya yük oluşturacaktır.

Yönetim arayüzüne geçiş yaparak **Overview** segmesinde node için bir süre sonra hafıza alarmı oluştuğunu, yük'ün sonlanması ardından alarmın kalktığını teyit edin.   **perf-test-producer-0**, **perf-test-producer-1** ve **perf-test-producer-2** bağlantılarının **blocked** durumuna geçtiğini; **perf-test-consumer-0**, **perf-test-consumer-1**, **perf-test-consumer-2** bağlantılarının **blocking** durumda olduğunu teyit edin.  