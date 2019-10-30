# Kaynakları Silme

Aşağıdaki komutu çalıştırarak konteynar shell oturumunu sonlandırın;

`exit`{{execute}}

Aşağıdaki komutla oluşturduğunuz kontrol grubunu silin;

`cgdelete -r -g cpu,memory:enterprisecoding_demo`{{execute}}

Busybox'ın ayıkladığımız dosyalarını temizleyin;

`rm -r $ROOTFS`{{execute}}
