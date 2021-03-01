# Lab Ortamı

Sizin için 2 ayrı node üzerinde RabbitMQ kurulumları yapılmış ve bir cluster oluşturulmuştur. Sağ bölümde yer alan **Terminal** segmesinde bu sunuculardan **rabbitmq01**'ya ait Terminal kullanılabilir durumdadır. Bu terminal üzerinden aşağıda belirtilen adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## RabbitMQ Cluster Durumu Kontrolü

Cluster durumunu aşağıdaki komutla kontrol edin;

`rabbitmqctl cluster_status`{{execute}}

Yan tarafta yer alan **RabbitMQ01** segmesini açarak RabbitMQ01 sunucusu yönetim arayüzüne ulaşın.
Açılan arayüzde **enterprisecoding** kullanıcı adı ve şifresi ile giriş yapın.

Yönetim arayüzünde her iki node'unda izlenebildiğini teyit edin.

Aynı işlemleri **RabbitMQ02** segmesi ile RabbitMQ02 sunucusu için de yapın.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.