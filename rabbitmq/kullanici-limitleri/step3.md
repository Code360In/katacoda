# Kullanıcı Limitleme


Aşağıdaki komutla **uygulama1** kullanıcını maksimumda 2 bağlantı ve 2 kanal açabilmesine izin verin;

`rabbitmqctl set_user_limits "uygulama1" '{"max-connections": 3, "max-channels": 3}'`{{execute}}

Yeniden aşağıdaki komutu çalıştırarak yük oluşturun;

`yuk-olustur`{{execute}}

Komutun aşağıdaki hata mesajıyla sonlandığını teyit edin;

`Connection refused for user 'uygulama1': user connection limit (4) is reached`

Aşağıdaki komutu kullanarak izin verilen limitlerde yük oluşturun;

`yuk-olustur2`{{execute}}

Bu komut 1 dakika süre için RabbitMQ'ya yük oluşturacaktır.

Yönetim arayüzüne geçiş yaparak **uygulama1** kullanıcısı ile daha az sayıda bağlantı ve kanal açıldığını teyit edin.