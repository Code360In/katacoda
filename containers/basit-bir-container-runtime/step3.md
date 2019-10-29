# Container Çalıştırma

Aşağıdaki komutu kullanarak `enterprisecoding_demo` kontrol grubu limitlerinde `unshare` process'ini başlatın;

`cgexec -g cpu,memory:enterprisecoding_demo unshare -uinpUrf --mount-proc sh -c "/bin/hostname enterprisecoding && chroot $ROOTFS /bin/sh"`{{execute}}

`unshare` busybox dizininde bilgisayar adı `enterprisecoding_demo` ve kök dizini ilk adımda oluşturduğumuz kök dizin olacak şekilde bir oturum başlatacaktır.

Açılan shell oturumu bize konteynar içerisinde komut çalıştırma imkanı sağlayacaktır. Aşağıdaki komutu çalıştırarak `merhaba dünya` diyebiliriz;

`echo "Enterprisecoding demo konteynar'ından merhaba!"`{{execute}}

Konteynar adını aşağıdaki komutla kontrol edin;

`hostname`{{execute}}

Çalışan process listesini alın;

`ps aux`{{execute}}

Ip bilgisini kontrol edin;

`ip addr`{{execute}}

loopback'in çalışmadığını göreceksiniz. Aşağıdaki komutu çalıştırarak container'dan çıkın;

`exit`{{execute}}

Aşağıdaki komutla host01'de olduğunuzu teyit edin;

`hostname`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
