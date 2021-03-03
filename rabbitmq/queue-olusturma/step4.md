# Komut Satırından Transient Queue Oluşturma

Aşağıdaki komutla **Direct** türündeki **lab.queue.transient.iki**'i tanımlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding declare queue --vhost=default name=lab.queue.transient.iki durable=false`{{execute}}

Yönetim arayüzüne giderek queue'un oluşturulduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.