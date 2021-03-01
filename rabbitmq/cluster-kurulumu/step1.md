# Lab Ortamı

Sizin için 2 ayrı node üzerinde RabbitMQ kurulumları yapılmıştır. Sağ bölümde yer alan **Terminal** segmesinde bu sunuculardan **rabbitmq01**'ya ait Terminal kullanılabilir durumdadır. Bu terminal üzerinden aşağıda belirtilen adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## RabbitMQ Cluster Kurulumu

Aşağıdaki komutla **rabbitmq02** sunucuna bağlanın;

`ssh rabbitmq02`{{execute}}

Aşağıdaki komutla RabbitMQ uygulamasını durdurun;

`rabbitmqctl stop_app`{{execute}}

Cluster'a dahil olacak tüm node'larda erlang çerezleri aynı değere sahip olmalıdır. Aşağıdaki komutla **rabbitmq01** sunucusundaki **/var/lib/rabbitmq/.erlang.cookie** dosyasını **rabbitmq02** sunucunda aynı yerdeki dosyanın üzerine yazacak şekilde kopyalayın;

`scp rabbitmq01:/var/lib/rabbitmq/.erlang.cookie /var/lib/rabbitmq/.erlang.cookie`{{execute}}

Aşağıdaki komutu çalıştıraran **rabbitmq01** cluster'ına katılmasını sağlayın;

`rabbitmqctl join_cluster rabbit@rabbitmq01`{{execute}}

Aşağıdaki komutla RabbitMQ uygulamasını yeniden başlatın;

`rabbitmqctl start_app`{{execute}}

Cluster durumunu aşağıdaki komutla kontrol edin;

`rabbitmqctl cluster_status`{{execute}}

SSH oturumunu sonlandırarak **rabbitmq01** sunucuna dönün;

`exit`{{execute}}

Cluster durumunu aşağıdaki komutla kontrol edin;

`rabbitmqctl cluster_status`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.