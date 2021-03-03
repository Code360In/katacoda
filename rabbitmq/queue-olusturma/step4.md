# Komut Satırından Transient Queue Oluşturma

Aşağıdaki komutla **Direct** türündeki **queue.lab.transient.iki**'i tanımlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding declare queue --vhost=default name=queue.lab.transient.iki durable=false`{{execute}}

Yönetim arayüzüne giderek queue'un oluşturulduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.