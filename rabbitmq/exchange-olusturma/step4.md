# Komut Satırından Transient Exchange Oluşturma

Aşağıdaki komutla **Direct** türündeki **ex.lab.transient.iki**'i tanımlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding declare exchange --vhost=default name=ex.lab.transient.iki durable=false type=direct`{{execute}}

Yönetim arayüzüne giderek exchange'in oluşturulduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.