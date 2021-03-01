# Guest Kullanıcısı Uzak Erişimine İzin Verme

Aşağıdaki komutla guest kullanıcısının uzaktan oturum açabilmesi için gerekli yapılandırmayı yapın;

```bash
cat > /etc/rabbitmq/rabbitmq.conf <<EOF
loopback_users = none
EOF
```{{execute}}

Aşağıdaki komut ile RabbitMQ hizmetini yeniden başlatın;

`systemctl restart rabbitmq-server`{{execute}}

Bu işlemler ardından **Local** segmesi üzerinden yönetim arayüzünü yeniden açın.

Kullanıcı adı ve şifre alanına **guest** değerini vererek giriş yapmayı deneyin. Daha önceki denemeden farklı olarak bu defa giriş yapabildiğinizi teyit edin..

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.