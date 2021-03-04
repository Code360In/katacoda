# RabbitMQ Shovel Kurulumu

## RabbitMQ01 Sunucusunda

Aşağıdaki komutla **rabbitmq01** sunucusunda shovel eklentisini kurun;

`rabbitmq-plugins enable rabbitmq_shovel`{{execute}}

Management UI eklentisi kurulu olduğu için aşağıdaki komutla shovel yönetim arayüzü eklentisini kurun;

`rabbitmq_shovel_management`{{execute}}

## RabbitMQ02 Sunucusunda

Aşağıdaki komutla **rabbitmq02** sunucuna bağlanın;

`ssh rabbitmq02`{{execute}}

Aşağıdaki komutla **rabbitmq02** sunucusunda federation eklentisini kurun;

`rabbitmq-plugins enable rabbitmq_federation`{{execute}}

Management UI eklentisi kurulu olduğu için aşağıdaki komutla federation yönetim arayüzü eklentisini kurun;

`rabbitmq-plugins enable rabbitmq_federation_management`{{execute}}

Aşağıdaki komutla **rabbitmq01** sunucusuna geri dönün.

`exit`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.