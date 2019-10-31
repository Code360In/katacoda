# Container Çalıştırma

Aşağıdaki komutu kullanarak `enterprisecoding_demo` kontrol grubu limitlerinde `unshare` process'ini başlatın;

`cgexec -g cpu,memory:enterprisecoding_demo unshare -uinpUrf --mount-proc sh -c "/bin/hostname enterprisecoding && chroot $ROOTFS /bin/sh"`{{execute}}

`unshare` komutu, bilgisayar adı `enterprisecoding` ve kök dizini ilk adımda oluşturduğumuz kök dizin olacak şekilde bağımsız bir oturum başlatacaktır.

Açılan shell oturumu bize konteynar içerisinde komut çalıştırma imkanı sağlayacaktır. Aşağıdaki komutu çalıştırarak `merhaba dünya` diyebiliriz;

`echo "Enterprisecoding demo konteynar'ından merhaba!"`{{execute}}

Konteynar adını aşağıdaki komutla kontrol edin;

`hostname`{{execute}}

Çalışan process listesini alın;

`ps aux`{{execute}}

`exit`{{execute}}

Aşağıdaki komutla host01'de olduğunuzu teyit edin;

`hostname`{{execute}}
