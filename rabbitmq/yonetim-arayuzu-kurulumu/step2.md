# Yetkili Kullanıcı Oluşturma

Aşağıdaki komutu çalıştırarak yeni bir kullanıcı oluşturun;

`rabbitmqctl add_user enterprisecoding enterprisecoding`{{execute}}

Oluşturduğunuz **enterprisecoding** kullanıcına aşağıdaki komutla **admin** yetkisi verin;

`rabbitmqctl set_user_tags enterprisecoding administrator`{{execute}}

Aşağıdaki komutla kullanıcının **/** sanal hostuna tam erişimini tanımlayın;

`rabbitmqctl set_permissions -p / enterprisecoding ".*" ".*" ".*"`{{execute}}

Yönetim arayüzüne giderek **guest** kullanıcısı oturumunda çıkış yapın. Ardından **enterprisecoding** kullanıcı adı ve şifresi ile giriş yapabildiğinizi teyit edin.