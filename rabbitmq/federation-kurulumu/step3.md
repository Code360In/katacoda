# RabbitMQ Federation Kurulumu

## RabbitMQ01 Sunucusunda

Aşağıdaki komutla **rabbitmq01** sunucusunda federation eklentisini kurun;

`rabbitmq-plugins enable rabbitmq_federation`{{execute}}

Management UI eklentisi kurulu olduğu için aşağıdaki komutla federation yönetim arayüzü eklentisini kurun;

`rabbitmq-plugins enable rabbitmq_federation_management`{{execute}}

## RabbitMQ02 Sunucusunda

Aşağıdaki komutla **rabbitmq02** sunucuna bağlanın;

`ssh rabbitmq02`{{execute}}

Aşağıdaki komutla **rabbitmq01** sunucusunda federation eklentisini kurun;

`rabbitmq-plugins enable rabbitmq_federation`{{execute}}

Management UI eklentisi kurulu olduğu için aşağıdaki komutla federation yönetim arayüzü eklentisini kurun;

`rabbitmq-plugins enable rabbitmq_federation_management`{{execute}}

Aşağıdaki komutla **rabbitmq01** sunucusuna geri dönün.

`exit`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.