# Cluster'dan Node çıkarma

Aşağıdaki komutla cluster'da çıkartılacak **rabbitmq02** sunucusuna bağlanın;

`ssh rabbitmq02`{{execute}}

RabbitMQ uygulamasını durdurun;

`rabbitmqctl stop_app`{{execute}}

Aşağıdaki komutla RabbitMQ'yu sıfırlayın;

`rabbitmqctl reset`{{execute}}

RabbitMQ uygulamasını başlatın;

`rabbitmqctl start_app`{{execute}}

Aşağıdaki komutla sunucuda cluster durumunu kontrol edin;

`rabbitmqctl cluster_status`{{execute}}

SSH oturumunu sonlandırarak **rabbitmq01** sunucuna dönün;

`exit`{{execute}}

Cluster durumunu aşağıdaki komutla kontrol edin;

`rabbitmqctl cluster_status`{{execute}}

**rabbitmq02**'nin artık cluster'da olmadığını teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.