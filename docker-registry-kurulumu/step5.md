# Kullanıcı Yetkilendirmesi Testi

Geldiğimiz noktada Docker Registry'si kullanıcı bilgileri olmadan kullanılabilir durumda değildir. Bunu aşağıdaki komut yardımıyla kullanıcı bilgileri olmadan bir imaj çekmeye çalışarak görebilirsiniz;

`docker pull $NODE_IP:$NODE_PORT/hello-world`{{execute HOST1}}

Kullanıcı bilgileri kullanılarak aşağıdaki komut yardımıyla Docker Registery'ye giriş yapılır;

`docker login $NODE_IP:$NODE_PORT`{{execute HOST1}}

Kullanıcı adı ve şifre bilgilerinin girilmesi ardından giriş işlemi başarılır olacaktır.

Docker Registry'ye giriş yapmadan önce yetkilendirme hatası aldığınız komutu yeniden denediğinizde artık bu hatayı almadığınızı göreceksiniz.

`docker pull $NODE_IP:$NODE_PORT/hello-world`{{execute HOST1}}

**Continue** butonuna basarak Kubernetes entegrasyonu adımına geçebilirsiniz.
