# RabbitMQ Eklentileri

Aşağıdaki komutla kullanılabilecek RabbitMQ eklentilerini ve kurulum durumlarını listeleyin;

`rabbitmq-plugins list`{{execute}}

Aşağıdaki komut ile yönetim eklentisini aktif hale getirin;

`rabbitmq-plugins enable rabbitmq_management`{{execute}}

Yeniden eklentileri listeleyerek yönetim eklentisinin kurulumunu teyit edin;

`rabbitmq-plugins list`{{execute}}

Aşağıdaki komut ile yönetim eklentisini pasif hale getirin;

`rabbitmq-plugins disable rabbitmq_management`{{execute}}

Yeniden eklentileri listeleyerek yönetim eklentisinin pasif durumunu teyit edin;

`rabbitmq-plugins list`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.