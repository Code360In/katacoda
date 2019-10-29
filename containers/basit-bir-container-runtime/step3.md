# Container Çalıştırma

Aşağıdaki komutu kullanarak `enterprisecoding_demo` kontrol grubu limitlerinde `unshare` process'ini başlatın;

`cgexec -g cpu,memory:enterprisecoding_demo unshare -uinpUrf --mount-proc sh -c "/bin/hostname enterprisecoding_demo && chroot $ROOTFS /bin/sh"`{{execute}}

`unshare` busybox dizininde bilgisayar adı `enterprisecoding_demo` ve kök dizini ilk adımda oluşturduğumuz kök dizin olacak şekilde bir oturum başlatacaktır.

Açılan shell oturumu bize konteynar içerisinde komut çalıştırma imkanı sağlayacaktır. Aşağıdaki komutu çalıştırarak `merhaba dünya` diyebiliriz;

`echo "Enterprisecoding demo konteynar'ından merhaba!"`{{execute}}

Konteynar adını aşağıdaki komutla kontrol edin;

`/bin/hostname`{{execute}}