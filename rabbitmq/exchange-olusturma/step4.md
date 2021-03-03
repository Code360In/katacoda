# Komut Satırından Transient Exchange Oluşturma

Aşağıdaki komutla **Direct** türündeki **lab.ex.transient.iki**'i tanımlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding declare exchange --vhost=default name=lab.ex.transient.iki durable=false type=direct`{{execute}}

Yönetim arayüzüne giderek exchange'in oluşturulduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.