# Komut Satırından Transient Exchange Oluşturma

Aşağıdaki komutla **Direct** türündeki **ikinciTransientExchange**'i tanımlayın;

`rabbitmqadmin -u enterprisecoding -p enterprisecoding declare exchange --vhost=default name=ikinciTransientExchange durable=false type=direct`{{execute}}

Yönetim arayüzüne giderek exchange'in oluşturulduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.