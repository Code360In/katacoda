# Overlayfs katmanları

Aşağıdaki komut yardımıyla mount işlemi ardından **/tmp/overlay-dizini/overlay** dizininin güncel durumunu görüntüleyin;

`ls -al /tmp/overlay-dizini/overlay`{{execute}}

**overlay** dizinin **middle,upper,workdir ve root** dizinlerinin birleşimi olduğunu teyit edin.

Aşağıdaki komutla root dizini içeriğini görüntüleyin;

`ls -al /root`{{execute}}

Aşağıdaki komutla overlay dizini altında "overlay'den merhaba" içeriğiyle **enterprisecoding-overlay-ornek.txt** dosyasını oluşturun;

`echo "overlay'den merhaba" > /tmp/overlay-dizini/overlay/enterprisecoding-overlay-ornek.txt`{{execute}}

Dosyanın oluştuğunu teyit edin;

`ls -al /tmp/overlay-dizini/overlay`{{execute}}

Dosyanın **root** dizininde oluşmadığını teyit edin.

`ls -al /root`{{execute}}

Dosyanın **upper** dizininde oluştuğunu teyit edin.

`ls -al /tmp/overlay-dizini/upper`{{execute}}

Dosyanın içeriğini görüntüleyin;

`cat /tmp/overlay-dizini/upper/enterprisecoding-overlay-ornek.txt`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
