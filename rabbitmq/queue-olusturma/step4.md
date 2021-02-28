# Komut Satırından Transient Queue Oluşturma

Aşağıdaki komutla **Direct** türündeki **ikinciTransientQueue**'i tanımlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding declare queue --vhost=default name=ikinciTransientQueue durable=false`{{execute}}

Yönetim arayüzüne giderek queue'un oluşturulduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.