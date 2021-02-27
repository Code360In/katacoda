# Komut Satırından Exchange Oluşturma

Aşağıdaki komutu çalıştırarak rabbitmqadmin uygulamasını yerele indirin;

`wget http://localhost:15672/cli/rabbitmqadmin -O /usr/local/bin/rabbitmqadmin`{{execute}}

İndirdiğiniz dosyayı çalıştırılabilir olarak işaretleyin;

`chmod +x /usr/local/bin/rabbitmqadmin`{{execute}}

Aşağıdaki komutla **Direct** türündeki **ikinciExchange**'i tanımlayın;

`rabbitmqadmin declare exchange name=ikinciExchange type=direct`{{execute}}

Yönetim arayüzüne giderek exchange'in oluşturulduğunu teyit edin.