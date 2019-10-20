# Standart Kullanıcılar ile İşlem

2013 yılında yayınlanan Linux 3.8 sürümü ile birlikte standart kullanıcılarda User Namespace oluşturabilme hakkına sahip oldu.

Aşağıdaki komut yardımıyla `test` adıyla bir kullanıcı oluşturun;

`useradd test`{{execute}}

Yeni oluşturduğunuz kullanıcıya geçiş yapın;

`su test`{{execute}}

Aşağıdaki komutu ile mevcutta kullanıcı adınızı teyit edin;

`whoami`{{execute}}

Aşağıdaki komutu çalıştırarak yeni bir namespace içerisinde bash oturumu başlatın;

`unshare -U /bin/bash`{{execute}}

Artık yeni namespace içerisinde başlatılan bash oturumundasınız. Aşağıdaki komutu çalıştırarak tekrar kullanıcı adınızı öğrenin;

`whoami`{{execute}}

Aşağıdaki komutla oturumdan çıkış yapınız;

`exit`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
